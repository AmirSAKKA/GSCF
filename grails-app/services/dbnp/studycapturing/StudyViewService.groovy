/**
 * StudyViewService Service
 * 
 * Description
 */
package dbnp.studycapturing

import dbnp.studycapturing.Study
import dbnp.authentication.SecUser

class StudyViewService {
    static transactional = true
	def authenticationService

    def fetchStudyForCurrentUserWithId(long id) {
	    SecUser user = authenticationService.getLoggedInUser()
	    return fetchStudyWithIdAndUser(id, user)
    }
	def fetchStudyWithIdAndUser(long id, SecUser user) {
	    Study study
	    def criteria = Study.createCriteria()

	    // check if we need to create or edit/view a study
	    if (user != null && id > 0) {
		    // is this user an administrator?
		    if (user && user.hasAdminRights()) {
			    study = Study.findById(id)
		    } else if (user) {
			    List studies = criteria.list {
				    and {
					    eq("id", id)
					    and {
						    or {
							    eq("owner", user)
							    writers {
								    eq("id", user.id)
							    }
							    readers {
								    eq("id", user.id)
							    }
						    }
					    }
				    }
			    }
			    study = (studies.size()>0) ? studies.first() : null
		    }
	    } else if (user == null && id > 0) {
		    List studies = criteria.list {
			    and {
				    eq("id", id)
				    eq("publicstudy", true)
			    }
		    }
		    study = (studies.size()>0) ? studies.first() : null
	    } else if (user != null) {
		    // create a new study with this user as owner
		    study = new Study()
		    study.owner = user
	    }

		return study
    }
}

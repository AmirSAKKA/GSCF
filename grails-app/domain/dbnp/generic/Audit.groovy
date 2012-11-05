package dbnp.generic

import dbnp.studycapturing.Study
import dbnp.authentication.SecUser

/**
 * Audit Domain Class
 *
 * Description
 */
class Audit {
	SecUser user
	String entityType
	String entityUUID
	String fieldName
	String fieldValue
	Date dateCreated

	static belongsTo = [
		study: Study
	]

	static constraints = {
		user(nullable: false, blank: false)
		entityType(nullable: true, blank: true)
		entityUUID(nullable: true, blank: true)
		fieldName(nullable: false, blank: false)
		fieldValue(nullable: true, blank: true)
	}
}

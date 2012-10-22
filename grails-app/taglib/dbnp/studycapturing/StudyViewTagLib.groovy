/**
 * StudyViewTagLib Tag Library
 *
 * Description
 */
package dbnp.studycapturing

import org.dbnp.gdt.TemplateEntity

class StudyViewTagLib {
	// define the tag namespace (e.g.: <foo:action ... />
	static namespace = "sv"

	def vertical = { attrs, body ->
		def entity = (attrs.containsKey('entity') && attrs.get('entity') instanceof TemplateEntity) ? attrs.get('entity') : null
		Boolean canRead = (attrs.containsKey('canRead')) ? attrs.get('canRead').toString().toBoolean() : false
		Boolean canWrite = (attrs.containsKey('canWrite')) ? attrs.get('canWrite').toString().toBoolean() : false
		String entityType = entity.class.toString().split(/\./).last()

		// iterate through entity fields
		entity.giveFields().each { field ->
			out << render(template: "common/templateElement", model: [
					entity: entity,
					entityType: entityType,
					field: field,
					fieldType:field.type.toString().toLowerCase(),
					canRead: canRead,
					canWrite: canWrite
			])
		}
	}

	def horizontal = { attrs, body ->
		def entity = (attrs.containsKey('entity') && attrs.get('entity') instanceof TemplateEntity) ? attrs.get('entity') : null
		Boolean canRead = (attrs.containsKey('canRead')) ? attrs.get('canRead').toString().toBoolean() : false
		Boolean canWrite = (attrs.containsKey('canWrite')) ? attrs.get('canWrite').toString().toBoolean() : false
		String entityType = entity.class.toString().split(/\./).last()

		out << render(template: "common/templateFields", model: [
				entity: entity,
				entityType: entityType,
				fields: entity.giveFields(),
				canRead: canRead,
				canWrite: canWrite
		])
	}
}
module ApplicationHelper
	#archivopara metodos de comporamientos visuales

def flash_class(type)
case type
	when :alert
	"alert-danger"

	when :notice
	"alert-success"

	else
		""

			end

		end
end

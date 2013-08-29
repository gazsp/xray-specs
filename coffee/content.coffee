
class ExtensionContent
	constructor: ->
		self = @

		chrome.extension.onMessage.addListener (request, sender, sendResponse) =>
			if request.action == "actionClicked"
				self.addRemoveStyleSheet 'RR_ColorsCSS'
				sendResponse
					message: "ok"
			else
				sendResponse {}

	addRemoveStyleSheet: (id) ->
		element = document.getElementById id
		if element?
			element.parentElement.removeChild element
			return

		link = document.createElement('link')
		link.rel = 'stylesheet'
		link.type = 'text/css'
		link.href = chrome.extension.getURL('css/debug.css')
		link.id = id
		(document.head||document.documentElement).appendChild(link)

new ExtensionContent

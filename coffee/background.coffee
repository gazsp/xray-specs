
class ColoursExtension

	@active = false

	constructor: ->
		console.log "Started background script"

		chrome.browserAction.onClicked.addListener (tab) -> 
			@active = !@active
			console.log @active
			chrome.tabs.sendMessage tab.id, { action: "actionClicked", state: @active }, (response) ->
				# alert response.message

new ColoursExtension
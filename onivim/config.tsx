import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
	console.log("config activated")

	// Input
	//
	// Add input bindings here:
	//
	oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

	//
	// Or remove the default bindings here by uncommenting the below line:
	//
	// oni.input.unbind("<c-p>")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
	console.log("config deactivated")
}

export const configuration = {
	"oni.useDefaultConfig": false,
	"ui.colorscheme": "lorentz",
	"oni.loadInitVim": true,
	"editor.fontFamily": "Hack",
	"editor.fontSize": "14px",
	"ui.fontSmoothing": "auto",

	"tabs.mode": "native",
	"ui.animations.enabled": false,
	"sidebar.enabled": false,
	"statusbar.enabled": false,
	"oni.hideMenu": true,
}

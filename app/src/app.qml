Item {
	anchors.fill: context;

	Emulator {
		id: emulator;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;

		run(data, options): {
			var self = this
			this.loading = true
			this.runImpl(data, options, function () { self.loading = false })
		}
	}

	BlobLoader {
		id: resource;
		url: "boot.ch8";

		onLoaded(data): {
			var options = {
				"tickrate": 200,
				"fillColor": "#FF00FF",
				"fillColor2": "#00FFFF",
				"blendColor": "#000000",
				"backgroundColor": "#00FFFF",
				"buzzColor": "#990099",
				"quietColor": "#330033",
				"shiftQuirks": false,
				"loadStoreQuirks": false,
				"vfOrderQuirks": false,
				"clipQuirks": false,
				"jumpQuirks": false,
				"screenRotation": false,
				"enableXO": false
			}
			emulator.run(data, options)
		}
	}
}

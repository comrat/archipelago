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

		onLoaded(data): { emulator.run(data, {}) }
	}
}

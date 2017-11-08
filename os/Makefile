BUILD:=build

$(BUILD)/boot.8o: Makefile sources/boot.8o sources/io.8o sources/image.8o \
	$(BUILD)/boot_tiles.8o
	cat sources/boot.8o sources/io.8o sources/image.8o > $@
	cat $(BUILD)/boot_tiles.8o >> $@

$(BUILD)/boot_tiles.8o: Makefile tools/generate-tiles assets/tiles/noxoio.png
	tools/generate-tiles --map0=1 assets/tiles/noxoio.png noxoio 1 8 > $@

xclip: Makefile $(BUILD)/boot.8o
	cat $(BUILD)/boot.8o | xclip

all: Makefile $(BUILD)/boot.8o
	@echo "done"
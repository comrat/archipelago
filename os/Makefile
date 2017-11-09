BUILD:=build
OCTO:=$(shell git rev-parse --git-dir)/../app/dist/octo/octo

all: modules
	@echo 'done, resulting binaries are in $(BUILD) dir'

$(BUILD)/boot.8o: Makefile sources/boot.8o sources/io.8o sources/image.8o \
	$(BUILD)/boot_tiles.8o
	cat sources/io.8o sources/boot.8o sources/image.8o > $@
	cat $(BUILD)/boot_tiles.8o >> $@

$(BUILD)/boot_tiles.8o: Makefile tools/generate-tiles assets/tiles/noxoio.png
	tools/generate-tiles --map0=1 assets/tiles/noxoio.png noxoio 1 8 > $@

xclip: Makefile $(BUILD)/boot.8o
	cat $(BUILD)/boot.8o | xclip

$(BUILD)/modules/00: Makefile $(BUILD)/boot.8o
	$(OCTO) $(BUILD)/boot.8o $@

$(BUILD)/modules:
	mkdir -p $(BUILD)/modules

modules: \
	$(BUILD)/modules \
	$(BUILD)/modules/00

clean:
	@rm -rf $(BUILD)/*

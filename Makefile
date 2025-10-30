CONFIG_PRESET := default
BUILD_DIR := build
INSTALL_DIR := bin
BUILD_PRESETS := release debug asan test

$(BUILD_PRESETS): configure
	@echo "Building with preset $@. Binaries will be installed to $(INSTALL_DIR)."
	cmake --build $(BUILD_DIR) --preset $@
	cmake --install $(BUILD_DIR) --config $@

configure:
	@echo "Running CMake configuration."
	cmake --preset $(CONFIG_PRESET)

# TODO: Avoid using hardcoded build/install directories
clean:
	@echo "Cleaning directories $(BUILD_DIR) and $(INSTALL_DIR)."
	rm -rf $(BUILD_DIR) $(INSTALL_DIR)
	
.PHONY: $(BUILD_PRESETS) configure clean
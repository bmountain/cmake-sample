CMAKE := $(shell command -v cmake 2> /dev/null)

CONFIG_PRESET := default
BUILD_DIR := build
INSTALL_DIR := bin
BUILD_PRESETS := release debug asan test

$(BUILD_PRESETS): $(BUILD_DIR)
	@echo "Build type: $@"
	@echo "Install directory: $(INSTALL_DIR)"
	cmake --build $(BUILD_DIR) --preset $@ -v
	cmake --install $(BUILD_DIR) --config $@

$(BUILD_DIR):
	@if [ -z "$(CMAKE)" ]; then\
		echo "Required cmake executable not found" >&2; \
		exit 1;\
	fi
	@if [ ! -f "$(BUILD_DIR)/CMakeCache.txt" ]; then \
		echo "Running CMake configuration"; \
		mkdir -p $(BUILD_DIR) && \
		$(CMAKE) --preset $(CONFIG_PRESET); \
		if [ $$? -ne 0 ]; then \
			echo "Deleting $(BUILD_DIR) directory." >&2; \
			rm -rf $(BUILD_DIR); \
			exit 1; \
		fi; \
	fi

configure: $(BUILD_DIR)

clean:
	@echo "Cleaning directories $(BUILD_DIR) and $(INSTALL_DIR)."
	@rm -rf $(BUILD_DIR) $(INSTALL_DIR)
	
.PHONY: $(BUILD_PRESETS) $(BUILD_DIR) configure clean
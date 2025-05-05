# Dartのソースコード
SRC := $(shell find ./lib -type f -name '*.dart')

# 静的ファイル
STATIC := $(shell find web -type f -not -name '*.dart'  -not -name 'index.*')
STATIC_BUILD := $(patsubst web/%,build/%,$(STATIC))

all: build/main.wasm $(STATIC_BUILD)

build/%.wasm: web/%.dart $(SRC)
	@dart compile wasm \
		--output=$@ \
		--optimization-level=4 \
		--no-source-maps \
		$<

build/%: web/%
	@mkdir -p $(@D)
	@cp $< $@
	@echo $@

.PHONY: init
init:
	dart pub get
	bun install

.PHONY: fmt
fmt:
	@deno fmt
	@dart format .

.PHONY: test
test:
	dart test .

.PHONY: run
run: serve

.PHONY: dev
dev: serve

.PHONY: serve
serve:
	bun dev

.PHONY: check
check:
	dart analyze

.PHONY: clean
clean:
	@rm -rf build

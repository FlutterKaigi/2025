all:
	@jaspr build \
		--experimental-wasm \
		--verbose \
		--optimize=4 \
		$<
	mv build/jaspr/404/index.html build/jaspr/404.html
	@rm -rf build/jaspr/404

.PHONY: init
init:
	dart pub get
	bun install
	dart pub global activate jaspr_cli

.PHONY: fmt
fmt:
	@dprint fmt
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
	jaspr serve

.PHONY: start
start:
	bun start

.PHONY: check
check:
	dart analyze

.PHONY: clean
clean:
	@rm -rf build

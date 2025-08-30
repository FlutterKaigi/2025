.PHONY: build
build:
	@jaspr build \
		--verbose \
		--optimize=4
	@mkdir -p build/_404
	@mv build/jaspr/ja/404 build/_404/ja
	@mv build/jaspr/en/404 build/_404/en

.PHONY: init
init:
	dart pub get
	bun install
	# NOTE: 不具合のワークアラウンド
	# https://github.com/dart-lang/sdk/issues/61373
	# https://github.com/schultek/jaspr/pull/531
	dart pub global activate --source=git \
		--git-path=packages/jaspr_cli \
		--git-ref=827dd3c6ab0dc3018d17eb36b6f7f7a390a6da99 \
		https://github.com/schultek/jaspr

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

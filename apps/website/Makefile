.PHONY: build
build: build-prod

.PHONY: build-dev
build-dev:
	@export $$(cat environments/.env.dev | grep -v '^#' | grep -v '^$$' | xargs) && $(MAKE) _build

.PHONY: build-stg
build-stg:
	@export $$(cat environments/.env.stg | grep -v '^#' | grep -v '^$$' | xargs) && $(MAKE) _build

.PHONY: build-prod
build-prod:
	@export $$(cat environments/.env.prod | grep -v '^#' | grep -v '^$$' | xargs) && $(MAKE) _build

.PHONY: _build
_build: fetch-sessions fetch-sponsors fetch-staffs
	@jaspr build \
		--verbose \
		--optimize=4
	@mkdir -p build/_404
	@mv build/jaspr/ja/404 build/_404/ja
	@mv build/jaspr/en/404 build/_404/en

.PHONY: fetch-sessions
fetch-sessions:
	@echo "Fetching session data from BFF API..."
	@echo "Using BFF_BASE_URL: $${BFF_BASE_URL:-https://2025-bff.flutterkaigi.jp/v1}"
	@dart run tool/fetch_sessions.dart

.PHONY: fetch-sponsors
fetch-sponsors:
	@echo "Fetching sponsor data from BFF API..."
	@echo "Using BFF_BASE_URL: $${BFF_BASE_URL:-https://2025-bff.flutterkaigi.jp/v1}"
	@dart run tool/fetch_sponsors.dart

.PHONY: fetch-staffs
fetch-staffs:
	@echo "Fetching staff members from BFF API..."
	@echo "Using BFF_BASE_URL: $${BFF_BASE_URL:-https://2025-bff.flutterkaigi.jp/v1}"
	@dart run tool/fetch_staffs.dart

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
run: dev

.PHONY: dev
dev: dev-prod

.PHONY: dev-dev
dev-dev:
	@export $$(cat environments/.env.dev | grep -v '^#' | grep -v '^$$' | xargs) && $(MAKE) _dev

.PHONY: dev-stg
dev-stg:
	@export $$(cat environments/.env.stg | grep -v '^#' | grep -v '^$$' | xargs) && $(MAKE) _dev

.PHONY: dev-prod
dev-prod:
	@export $$(cat environments/.env.prod | grep -v '^#' | grep -v '^$$' | xargs) && $(MAKE) _dev

.PHONY: _dev
_dev: fetch-sessions fetch-sponsors fetch-staffs serve

.PHONY: serve
serve:
	jaspr serve --port 8081

.PHONY: start
start:
	bun start

.PHONY: check
check:
	dart analyze

.PHONY: clean
clean:
	@rm -rf build

# phpstan workbench symlink issue reproduction

This is to reproduce the issue described at https://github.com/phpstan/phpstan/issues/9554#issuecomment-2158089128, where
the phpstan `excludePath` is is still analysing or scanning the files in the excluded path, which causes an error when 
orchestra/testbench creates a symliunk at `vendor/orchestra/testbench-core/laravel/vendor` (in an excluded path).

## Setup

1. Clone this repository
2. Run `docker compose build --pull`
3. Run `docker compose up -d`
4. Run `docker compose exec app composer install`

## Reproduction of the issue

1. Run `docker compose exec app ./vendor/bin/phpstan --configuration=phpstan.neon analyse --error-format=raw --memory-limit=1G`

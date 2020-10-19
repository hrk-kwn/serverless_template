.PHONY: build clean deploy cleanup f_deploy f_invoke s_clean f_build fmt f_fmt

# 作業環境
TEST_DATA = ./event/event.json

# Go パラメータ
GOCMD = go
GOBUILD = $(GOCMD) build
GOCLEAN = $(GOCMD) clean
GOTEST = $(GOCMD) test
GOGET = $(GOCMD) get
GOFMT = $(GOCMD) fmt

# severless関連のパラメータ
SLSCD = sls
SLSDEPLOY = $(SLSCD) deploy --profile ${profile} --v
SLSDEPLOYFUNCTION = $(SLSDEPLOY) --profile ${profile} -f ${f_name}
SLSINVOKE = $(SLSCD) invoke --profile ${profile} --log
SLSCLEAN = $(SLSCD) remove --profile ${profile} -v

build: ## 作成関数をbuildします。
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go

f_build: ## 作成関数を指定buildします。
	env GOOS=linux go build -ldflags="-s -w" -o bin/${f_name} ${f_name}/main.go

clean: ## 作成バイナリを削除します。
	rm -rf ./bin

cleanup:clean fmt build ## 削除、作成関数を綺麗に、buildします。

deploy:cleanup ## Serverlessを利用してdeployします。
	${SLSDEPLOY}

fmt: ## 関数を綺麗にします。
	${GOFMT} ./hello/main.go
	${GOFMT} ./world/main.go

f_fmt: ## 関数を指定してプログラムを綺麗にします。
	${GOFMT} ./${f_name}/main.go

f_deploy:clean f_fmt f_build ## 関数を指定してdeployします。
	${SLSDEPLOYFUNCTION}

f_invoke: ## 関数をテスト実行します。
	${SLSINVOKE} --function ${f_name} -p ${TEST_DATA}

s_clean: ## uploadしたAWS関連を削除します。
	${SLSCLEAN}

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

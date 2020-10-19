.PHONY: deploy f_deploy f_invoke s_clean

# 作業環境
TEST_DATA = ./event/event.json

# severless関連のパラメータ
SLSCD = sls
SLSDEPLOY = $(SLSCD) deploy --profile ${profile} --v
SLSDEPLOYFUNCTION = $(SLSDEPLOY) --profile ${profile} -f ${f_name}
SLSINVOKE = $(SLSCD) invoke --profile ${profile} --log
SLSCLEAN = $(SLSCD) remove --profile ${profile} -v

deploy: ## Serverlessを利用してdeployします。
	npm install
	${SLSDEPLOY}

f_deploy: ## 関数を指定してdeployします。
	${SLSDEPLOYFUNCTION}

f_invoke: ## 関数をテスト実行します。
	${SLSINVOKE} --function ${f_name} -p ${TEST_DATA}

s_clean: ## uploadしたAWS関連を削除します。
	${SLSCLEAN}

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

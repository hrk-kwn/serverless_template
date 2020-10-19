setup/all: ## 必要な物をインストールします。グローバルインストールやめる。
	npm install -g serverless

setup: ## serverlessframework
	sls create --template -t ${runtime} --path ${p_name}
	mkdir ./${p_name}/config
	mkdir ./${p_name}/config/iam
	mkdir ./${p_name}/config/event
	cp ./templates/${runtime}/Makefile ./${p_name}/Makefile
	cp ./templates/${runtime}/serverless.yml ./${p_name}/serverless.yml
	cp ./templates/${runtime}/README.md ./${p_name}/README.md
	cp ./templates/iam/preview_IAMPassRoleAccess.txt ./${p_name}/config/iam/preview_IAMPassRoleAccess.txt
	cp ./templates/iam/live_IAMPassRoleAccess.txt ./${p_name}/config/iam/live_IAMPassRoleAccess.txt
	cp ./templates/${runtime}/config/event/event.json ./${p_name}/config/event/event.json
	cp ./templates/${runtime}/config/config.yml ./${p_name}/config/config.yml
	sed -i "" -e "s/p_name/${p_name}/g" ./${p_name}/serverless.yml
	sed -i "" -e "s/p_name/${p_name}/g" ./${p_name}/config/iam/preview_IAMPassRoleAccess.txt
	sed -i "" -e "s/p_name/${p_name}/g" ./${p_name}/config/iam/live_IAMPassRoleAccess.txt
	sed -i "" -e "s/aws_id/${aws_id}/g" ./${p_name}/config/iam/preview_IAMPassRoleAccess.txt
	sed -i "" -e "s/aws_id/${aws_id}/g" ./${p_name}/config/iam/live_IAMPassRoleAccess.txt
	sed -i "" -e "s/p_name/${p_name}/g" ./${p_name}/config/config.yml

help: ## makeお助けコマンド
	@grep -E '^[a-zA-Z/_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
package container

pods := [{
	"metadata": {
        "name": "apache-pod"
	},
	"spec": {
		"containers": [{
			"name": "apache-container",
			"image": "httpd",
			"resources": {
				"limits": {
					"cpu": "1000m",
					"memory": "256Mi"
				}
			}
		}]
	}
}, {
	"metadata": {
        "name": "nginx-pod"
	},
	"spec": {
		"containers": [{
			"name": "nginx-container",
			"image": "nginx",
			"securityContext": {
				"allowPrivilegeEscalation": true
			}
		}]
	}
}, {
	"metadata": {
        "name": "mysql-pod"
	},
	"spec": {
		"containers": [{
			"name": "mysql-container",
			"image": "mysql",
			"securityContext": {
				"allowPrivilegeEscalation": false
			}
		}]
	}
}]

#todo: 複数の Pod のデータ (pods) から、Pod 内に含まれるコンテナの Security Contextに
#todo: allowPrivilegeEscalation: true が設定されているコンテナを検出した場合に
#todo: 「権限昇格が可能なコンテナを含む Pod が存在します: <Pod の名前>」というメッセージの集合を返すルール allow_privilege_escalation_checker を定義

allow_privilege_escalation_checker[msg] {
    #todo: 各要素から取得してくる
    pods := pods[_]
    container := pod.spec.containers[_]
    containers.SecurityContext.allowPrivilegeEscalation
    msg := sprintf("権限昇格が可能なコンテナを含むPodが存在します: %v, [pod.metadata.name]")
}

# 評価結果
# {
#   "allow_privilege_escalation_checker": [
#        "権限昇格が可能なコンテナを含む Pod が存在します: nginx-pod"
#    ]
# }

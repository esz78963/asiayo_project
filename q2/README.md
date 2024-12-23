1. # Q2

此專案包含 Asiayo 的基礎設施配置和 Kubernetes manifest 檔案。
因為平時比較喜歡使用kustomize來管理 manifest檔案 所以使用kustomize
## 專案結構

```
asiayo-infra/
├── terraform/                # AWS infra設置
│   ├── main.tf               # 主要需求配置
│   ├── outputs.tf            # 檢查用輸出值
│   ├── provider.tf           # Provider 配置
│   ├── terraform.tfvars      # 變數
│   └── variables.tf          # 變數定義
│
└── k8s-manifest/             # Kubernetes 設置
    ├── database/             # 資料庫相關配置(kmz化)
    ├── namespace.yaml        # namespace定義
    ├── service/              # svc
    ├── storage/              # pv,pvc
    └── web-manifests/        # Web (kmz化)
```

## Terraform使用
```
# 初始化
terraform init

# plan
terraform plan

# apply
terraform apply
```

## k8s manifest
Database以及Web使用kmz進行環境管理：

### 目錄結構
```
web-manifests/
├── base/                 
│   ├── deployment.yaml        # Web
│   ├── ingress.yaml           # Ingress
│   └── kustomization.yaml
└── overlays/                  # 環境分配
    ├── neil-test/        
    │   ├── kustomization.yaml
    │   ├── patch.yaml      
    │   └── ingress-patch.yaml
    └── neil-prod/        
        ├── kustomization.yaml
        ├── patch.yaml      
        └── ingress-patch.yaml
```
```
database/
├── base/                  # database
│   ├── kustomization.yaml
│   ├── mysql.yaml
│   ├── reader.yaml
│   └── writer.yaml
└── overlays/              # 環境分配
    ├── neil-prod/
    │   ├── kustomization.yaml
    │   └── patch.yaml
    └── neil-test/
        ├── kustomization.yaml
        └── patch.yaml
```
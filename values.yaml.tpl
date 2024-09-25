ingress:
  core:
    annotations:
      ingress.kubernetes.io/proxy-body-size: "0"  
      ingress.kubernetes.io/ssl-redirect: "true"
      nginx.ingress.kubernetes.io/proxy-body-size: "0"
      nginx.ingress.kubernetes.io/ssl-redirect: "true"
      cert-manager.io/issuer: ${issuer_name}
      cert-manager.io/issuer-kind: ${issuer_kind}
      cert-manager.io/issuer-group: cert-manager.k8s.cloudflare.com
      external-dns.alpha.kubernetes.io/cloudflare-proxied: "true"
    hostname: harbor.${domain_name}
    IngressClassName: nginx
  tls:
    enabled: true
    certSource: secret
    secret:
      secretName: "harbor-${dash_domain_name}"
externalURL: https://harbor.${domain_name}
adminPassword: ${harbor_admin_password}

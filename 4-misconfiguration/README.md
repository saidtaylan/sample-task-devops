# Misconfiguration Task

> I created very easy and basic misconfigured manifest file to test the troubleshooting process. Although it is a very basic example, it is a good starting point to understand the process path which from pod to ingress.

First of all, let's clone the repository:

```bash
git clone https://github.com/saidtaylan/sample-task-devops.git
cd sample-task-devops/4-misconfiguration
```

To get started troubleshooting, let's check the pod status:
```bash
kubectl get pod
```
The pod had a status of Running. So, I had to find the IP address of the pod to verify it was running. I ran the following command and copied the pod's IP address:

```bash
kubectl get pods -o wide
```
Then, I sent a request to the pod's IP and got the following response:

```bash
curl http://<ip-address>
```
The pod responded, confirming it was working properly.

Next, I investigated whether the service was working. I ran the following command:

```bash
kubectl get svc
curl http://<service-ip>
```
The service did not respond. I needed to find out why it wasn't working. I opened the manifest file and noticed the pod container port was 80, but the service target port was set to 8000.

To fix this issue, I updated the target port in the service to 80 and then applied the changes:

```bash
kubectl apply -f misconfigured-manifests.yaml
```
After this fix, the service started working correctly.

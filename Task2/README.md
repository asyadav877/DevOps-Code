# High-Availability Kubernetes Deployment Example

High-availability Kubernetes deployment with the following features:

- **ReplicaSet**: Manages multiple replicas of the application for redundancy and fault tolerance.
- **Readiness and Liveness Probes**: Monitors the health of the application to ensure smooth operation and self-healing.
- **Horizontal Pod Autoscaler (HPA)**: Dynamically adjusts the number of replicas based on resource usage metrics.
- **Pod Disruption Budget (PDB)**: Limits disruptions to maintain application availability during updates and maintenance.

## Usage

1. **Apply the configuration**:

    ```shell
    kubectl apply -f k8s-deployment/
    ```

2. **Monitor the deployment**: Check the deployment's status and resource utilization using `kubectl`.

3. **Adjust settings**: Customize the configuration (e.g., HPA thresholds, PDB limits) according to your application needs.

## Notes
- **Scalability**: The HPA automatically scales replicas based on resource usage.
- **Availability**: The PDB ensures the application remains highly available during disruptions.


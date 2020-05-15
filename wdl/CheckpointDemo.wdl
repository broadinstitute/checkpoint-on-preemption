version 1.0

workflow CheckpointDemo {
    input {
        String gcs_checkpoint
    }

    call SimulateTraining { input: gcs_checkpoint = gcs_checkpoint }
}

task SimulateTraining {
    input {
        String gcs_checkpoint
    }

    command <<<
        set -euxo pipefail

        export SYNC_INTERVAL=90

        echo "Starting simulated training" | tee -a training.txt

        # each minute of simulated training
        for i in {1..3}
        do
            sleep 60
            echo " -- training iteration $i/5" | tee -a training.txt
        done

        echo "Finished simulated training" | tee -a training.txt
    >>>

    output {
        File out = "training.txt"
    }

    runtime {
        cpu:            1
        memory:         "1 GiB"
        disks:          "local-disk 1 HDD"
        bootDiskSizeGb: 10
        preemptible:    2
        maxRetries:     0
        docker:         "us.gcr.io/broad-dsp-lrma/checkpoint:0.1.2"
    }
}

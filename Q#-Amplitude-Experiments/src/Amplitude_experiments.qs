namespace quantum_amplitude_experiment{

    import Std.Math.PI;

    operation ApplyAmplitudeBias(q1:Qubit , q2:Qubit):Unit{
        X(q2);

        //* Apply a small rotation to bias q1 toward one measurment outcome
        Ry(PI()/10.0,q1);
        Rx(PI()/20.,q1);
        
        Ry(PI()/7.0,q2);
        Rx(PI()/10.0,q2);
        
    }

    operation CreateEntangledLedChain(q1:Qubit):Unit{
        X(q1);
    }

    operation ApplyRotationExperment(q1:Qubit , q2:Qubit , q3:Qubit , q4:Qubit):Unit{
        CNOT(q1,q2);
        CNOT(q2,q3);
        CNOT(q2,q4);
    }

    @EntryPoint()

    operation circuit():Result[]{

        use q = Qubit[7];

        ApplyAmplitudeBias(q[3] , q[2]);
        CreateEntangledLedChain(q[0]);

        CNOT(q[0],q[1]);

        ApplyRotationExperment(q[2],q[3],q[5],q[6]);

        let q0 = M(q[0]);
        let q1 = M(q[1]);
        let q2 = M(q[2]);
        let q3 = M(q[3]);
        let q4 = M(q[4]);
        let q5 = M(q[5]);
        let q6 = M(q[6]);

        ResetAll(q);

        return [q0,q1,q2,q3,q4,q5,q6];
    }
}
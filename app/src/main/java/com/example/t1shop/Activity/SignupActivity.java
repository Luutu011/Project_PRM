package com.example.t1shop.Activity;

import android.content.Intent;
import android.nfc.Tag;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.t1shop.Activity.MainActivity;
import com.example.t1shop.R;
import com.example.t1shop.databinding.ActivitySignupBinding;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;

public class SignupActivity extends BaseActivity {
ActivitySignupBinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivitySignupBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        SetVariable();
    }

    private void SetVariable() {
    binding.signupBtn.setOnClickListener(view -> {
        String email = binding.emailEdit.getText().toString();
        String pass = binding.passEdit.getText().toString();
        if(pass.length() < 6){
            Toast.makeText(SignupActivity.this, "Your passowrd must be 6 characters", Toast.LENGTH_SHORT).show();
            return;
        }
        nAuth.createUserWithEmailAndPassword(email,pass).addOnCompleteListener(SignupActivity.this, task -> {
            if(task.isSuccessful()) {
                Log.i(TAG,"onComplete: ");
                startActivity(new Intent(SignupActivity.this, MainActivity.class));
            }else {
                Log.i(TAG,"failure: " + task.getException());
                Toast.makeText(SignupActivity.this,"Authentication failed", Toast.LENGTH_SHORT).show();
            }
        });
    });
        binding.loginBtn.setOnClickListener(view -> {

                startActivity(new Intent(SignupActivity.this, LoginActivity.class));


        });
    }
}
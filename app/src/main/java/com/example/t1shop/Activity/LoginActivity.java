package com.example.t1shop.Activity;

import android.content.Intent;
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
import com.example.t1shop.databinding.ActivityLoginBinding;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;

public class LoginActivity extends BaseActivity {
    ActivityLoginBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityLoginBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        SetVariable();
    }

    private void SetVariable() {
        binding.loginBtn.setOnClickListener(view -> {
            String email = binding.emailEdit.getText().toString();
            String pass = binding.passEdit.getText().toString();
            if(!email.isEmpty() && !pass.isEmpty()) {
                nAuth.signInWithEmailAndPassword(email,pass).addOnCompleteListener(LoginActivity.this, task -> {
                    if(task.isSuccessful()) {
                        startActivity(new Intent(LoginActivity.this, MainActivity.class));
                    }else {
                        Toast.makeText(LoginActivity.this,"Authentication failed", Toast.LENGTH_SHORT).show();
                    }
                });
            }
        });
        binding.signupBtn.setOnClickListener(view -> startActivity(new Intent(LoginActivity.this, SignupActivity.class)));

    }
}
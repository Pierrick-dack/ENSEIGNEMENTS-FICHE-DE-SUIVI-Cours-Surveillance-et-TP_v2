<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LogAdminRequest extends FormRequest {

    public function authorize(): bool {
        return true;
    }

    public function rules(): array {
        return [
            'nomCD' => 'required',
            'emailCD' => 'required|email',
            'mdpCD' => 'required|min:6|max:12',
        ];
    }
}

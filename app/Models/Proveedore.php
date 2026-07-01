<?php

namespace App\Models;

use Faker\Provider\Person;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proveedore extends Model
{
    use HasFactory;
    public function persona(){
        return $this->belongsTo(Persona::class);
    }

    public function compra(){
        return $this->hasMany(Compra::class);
    }
}

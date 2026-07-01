<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Testing\Fluent\Concerns\Has;

class Marca extends Model
{
    use HasFactory;

    public function producto(){
        return $this->hasMany(Producto::class);
    }

    public function caracteristica(){
        return $this->belongsTo(Caracteristica::class);
    }
}

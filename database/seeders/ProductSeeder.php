<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('products')->insert([
            ['name' => 'Áo thun', 'image' => '', 'price' => 199000, 'quantity' => 100, 'description' => 'Áo thun chất liệu cotton', 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['name' => 'Quần jean', 'image' => '', 'price' => 399000, 'quantity' => 100, 'description' => 'Quần jean thời trang', 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
            ['name' => 'Giày thể thao', 'image' => '', 'price' => 799000, 'quantity' => 50, 'description' => 'Giày sneaker nam nữ', 'created_at' => Carbon::now(), 'updated_at' => Carbon::now()],
        ]);
    }
}

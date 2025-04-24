<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use App\Models\User;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = User::all();

        foreach ($users as $user) {
            $orderCount = rand(1, 3); // Mỗi user có từ 1 đến 3 đơn hàng

            for ($i = 0; $i < $orderCount; $i++) {
                DB::table('orders')->insert([
                    'user_id' => $user->id,
                    'total_amount' => rand(100000, 5000000), // số tiền ngẫu nhiên
                    'address' => fake()->address(),
                    'created_at' => Carbon::now()->subDays(rand(0, 30)),
                    'updated_at' => Carbon::now(),
                ]);
            }
        }
    }
}

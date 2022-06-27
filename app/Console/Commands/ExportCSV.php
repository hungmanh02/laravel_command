<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class ExportCSV extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:exportcsv';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
            $fileName="pro.csv";
            $filePath=storage_path("app/public/".$fileName);
            $handle = fopen($filePath,"w");
            $columns=array('id', 'product_name', 'product_image', 'product_quantity', 'product_price', 'product_description', 'category_id','status','created_at', 'updated_at');
            fputcsv($handle,$columns);
            fclose($handle);
            $id=1;
            // $limit=10;
            while(true)
            {
                $products=DB::table('products')->where('id','>',$id)->limit(5)->get();
                if($products->count() == 0 )
                break;
                    $fileName="pro.csv";
                    $filePath=storage_path("app/public/".$fileName);
                    $handle = fopen($filePath,"a");
                    foreach ($products as $product) 
                    {
                                $dataline=array(
                                    $product->id,
                                    $product->product_name,
                                    $product->product_image,
                                    $product->product_quantity,
                                    $product->product_price,
                                    $product->product_description,
                                    $product->category_id,
                                    $product->status,
                                    $product->created_at,
                                    $product->updated_at,
                                    $id=$product->id,
                                );
                                fputcsv($handle,$dataline);
                    } 
            }
    }
}

python -i predict.py --gpu_id 0,1 --kmer_aggregation --nmute 0 --epochs 100 --nlayers 5 \
--batch_size 256 --kmers 5 --lr_scale 0.1 --path ../../input \
--dropout 0.1 --nclass 5 --ntoken 15 --nhead 32 --ninp 256 --nhid 1024 --warmup_steps 600 \
--fold 0 --weight_decay 1e-4 --nfolds 1 --weights_path r"D:\DAQIU\DLGP\SecretJob\190.RNAdegformer-Webapp-main\RNAdegformer-main\src\OpenVaccine\best_weights\fold0top1.ckpt"

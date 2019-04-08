#!/bin/bash
# generate the mz-datasets
python prepare_mz_data.py --data_path Robust04Corpus --train_file split1_train_BM25_0.9_0.5_RM3_47_9_0.3.txt --dev_file split1_dev_BM25_0.9_0.5_RM3_47_9_0.3.txt --test_file split1_test_BM25_0.9_0.5_RM3_47_9_0.3.txt

# generate word embedding
# python gen_w2v.py glove.840B.300d.txt word_dict.txt embed_glove_d300
# python norm_embed.py embed_glove_d300 embed_glove_d300_norm
python gen_w2v.py glove.GoogleNews-vectors-negative300.txt word_dict.txt embed_glove_d300
python norm_embed.py embed_glove_d300 embed_glove_d300_norm
#python gen_w2v.py GloVe/vectors.txt word_dict.txt embed_glove_d300
#python norm_embed.py embed_glove_d300 embed_glove_d300_norm
# python gen_w2v.py glove.6B.50d.txt word_dict.txt embed_glove_d50
# python norm_embed.py embed_glove_d50 embed_glove_d50_norm

# generate data histograms for drmm model
# generate data bin sums for anmm model
# generate idf file
cat word_stats.txt | cut -d ' ' -f 1,4 > embed.idf
python gen_hist4drmm.py 20
# python gen_binsum4anmm.py 20 # the default number of bin is 20

echo "Done ..."

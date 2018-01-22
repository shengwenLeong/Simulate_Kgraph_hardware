/*************************************************************************
	> File Name: sim_kgraph.c
	> Author: 
	> Mail: 
	> Created Time: 2018年01月19日 星期五 18时24分49秒
 ************************************************************************/

#include<stdio.h>
#include<stdint.h>
#include<stdlib.h>
#include<string.h>
#include<inttypes.h>
#define YES 1
#define NO 0

typedef struct 
{
    uint32_t id;
    uint64_t code:48;
}id_code;

typedef struct
{
    int update;         // to identify the memory should be process
    int process_counter; //records the process id all number;
    int update_counter; //records the update id all number
    uint32_t id[4096];
}memory_id;
uint64_t htoi(unsigned char str[],int str_length) {
	// variables
	int hexadecimal;
	int counter = 0;
	int flag = YES;
	uint64_t finalNumber = 0;
    unsigned char *string = (unsigned char *)malloc(sizeof(unsigned char)*str_length);
    memset(string,0,sizeof(unsigned char)*str_length);
    memcpy(string,str,sizeof(unsigned char)*str_length);
    *(string+str_length) = '\0';
	// check if hexadecimal number has OX or Ox
	if (string[counter] == '0') {
		++counter;
		if (string[counter] == 'x' || string[counter] == 'X') {
			++counter;
		}
	}

	// transform
	for (; flag == YES; ++counter) {
		if(string[counter] >= '0' && string[counter] <= '9') {
			hexadecimal = string[counter] - '0';
		}
		else if (string[counter] >= 'a' && string[counter] <= 'f') {
			hexadecimal = string[counter] - 'a' + 10;
		}
		else if (string[counter] >= 'A' && string[counter] <= 'F') {
			hexadecimal = string[counter] - 'A' + 10;
		}
		else {
			flag = NO;
		}

		if (flag == YES) {
			finalNumber = 16 * finalNumber + hexadecimal;
		}

	}
    free(string);
	return finalNumber;
}

int check_id(memory_id *memory_id , uint32_t id)
{
    int i,j;
    for(i=0;i<10;++i)
    {
        for(j=0;j<4096;++j)
        {
            if(memory_id[i].id[j] == id)
            {
                return 1;
            }
        }
    }
    return 0;

}
uint64_t compute_hamming_distance(uint64_t query, uint64_t id_hash)
{
    uint64_t res = __builtin_popcount(query ^ id_hash);
    return res;
}
void storeid2memory(memory_id *memory, uint32_t id , int dist)
{
    int counter;
    if(!check_id(memory,id))
    {
        switch(dist)
        {
            case 0  :counter = memory[0].process_counter;memory[0].id[counter] = id;memory[0].process_counter = counter + 1;memory[0].update = 1;break;
            case 1  :counter = memory[1].process_counter;memory[1].id[counter] = id;memory[1].process_counter = counter + 1;memory[1].update = 1;break;
            case 2  :counter = memory[2].process_counter;memory[2].id[counter] = id;memory[2].process_counter = counter + 1;memory[2].update = 1;break;
            case 3  :counter = memory[3].process_counter;memory[3].id[counter] = id;memory[3].process_counter = counter + 1;memory[3].update = 1;break;
            case 4  :counter = memory[4].process_counter;memory[4].id[counter] = id;memory[4].process_counter = counter + 1;memory[4].update = 1;break;
            case 5  :counter = memory[5].process_counter;memory[5].id[counter] = id;memory[5].process_counter = counter + 1;memory[5].update = 1;break;
            case 6  :counter = memory[6].process_counter;memory[6].id[counter] = id;memory[6].process_counter = counter + 1;memory[6].update = 1;break;
            case 7  :counter = memory[7].process_counter;memory[7].id[counter] = id;memory[7].process_counter = counter + 1;memory[7].update = 1;break;
            case 8  :counter = memory[8].process_counter;memory[8].id[counter] = id;memory[8].process_counter = counter + 1;memory[8].update = 1;break;
            default :counter = memory[9].process_counter;memory[9].id[counter] = id;memory[9].process_counter = (counter+1>4096)?0:(counter + 1);memory[9].update = 1;break;
        }
    }
    else{
    }
}
int generate_id(memory_id *memory)
{
    int gen_id,i;
    for(i=0;i<10;++i)
    {
        if(memory[i].update)
        {
            gen_id =memory[i].id[memory[i].update_counter];
            memory[i].update_counter += 1;
            memory[i].update = (memory[i].update_counter == memory[i].process_counter)?0:memory[i].update;
            return gen_id; 
        }
        else 
        {
            continue;
        }
        
    }
}
uint32_t* process_kgraph(id_code **idcode , uint64_t query_code,int K)
{
    int i,j;
    for(i=0;i<1;++i)
    {
        for(j=0;j<25;++j)
        {
            printf("id=%d",idcode[i][j].id);
            //printf("code=%ld",idcode[i][j].code);
        }
    }
    memory_id *memoryid = (memory_id *)malloc(sizeof(memory_id)*10);
    for(i=0;i<10;++i)
    {
        memoryid[i].update = 0;
        memoryid[i].process_counter = 0;
        memoryid[i].update_counter = 0;
        for(j=0;j<4096;++j)
        {
            memoryid[i].id[j] = (uint32_t)0;
        }
    }
    for(i=0;i<50;++i)
    {
        int dist = compute_hamming_distance(query_code , idcode[i/50][i%50].code);
        storeid2memory(memoryid,idcode[i/50][i%50].id,dist);
    }
    unsigned int compute_id_counter = 0;
    unsigned int L = 100;   // user to configure this parameter to determine the number of id should be return;*/
    while(compute_id_counter<L)
    {
        int id = generate_id(memoryid);
        int id_counter = 0;
        for(i=0;i<25;++i)
        {
            int stor_id = idcode[id][i].id;
            int distance = compute_hamming_distance(query_code , idcode[id][i].code);
            storeid2memory(memoryid,stor_id,distance);
        }
        for(i=0;i<9;++i)
        {
            id_counter += memoryid[i].process_counter;
        }
        printf("id_counter=%d\n",id_counter);
        compute_id_counter = id_counter;
    }
        
    printf("---------generate_id---------------\n");
    for(i=0;i<15;++i)
        printf("generate_id is %d\n",generate_id(memoryid));
    for(i=0;i<10;++i)
    {
        printf("--------------------------------------------------------\n");
        printf("memory update is %d \n",memoryid[i].update);
        printf("memory process_counter is %d \n",memoryid[i].process_counter);
        printf("memory update_counter is %d \n",memoryid[i].update_counter);
        for(j=0;j<memoryid[i].process_counter;++j)
        {
            printf(" %d",memoryid[i].id[j]);
        }
    }
    //------------------------------------------------------
    //-------------return result----------------------------
    uint32_t *result = (uint32_t *)malloc(L*sizeof(uint32_t));
    int pointer = 0;
    for(i=0;i<9;++i)
    {
        for(j=0;j<memoryid[i].process_counter;++j)
        {
            *(result+pointer) = memoryid[i].id[j];
            pointer++;
        }
    }
    free(memoryid);
    return result;
    
}


int main()
{
    int dim1=50002;
    int dim2=25;
    int dim3=10;
    int i,j,k,l;
    int *label = (int *)malloc(50000*sizeof(int));
    FILE *infile,*inlabel;
    infile = fopen("init_input_data.bin","rb");
    inlabel = fopen("train-label.txt","r");
    for(i=0;i<50000;++i)
    {
        fscanf(inlabel,"%d",&label[i]);
    }

    id_code **idcode = (id_code **)malloc(dim1*sizeof(id_code *));
    for(i=0;i<dim1;++i)
    {
        idcode[i] = (id_code *)malloc(dim2*sizeof(id_code));
    }
    for(i=0;i<50002;++i)
    {
        for(j=0;j<25;++j)
        {
            
            unsigned char line[10];
            fread(line,sizeof(line),1,infile);
            unsigned char *id_buf = (unsigned char *)malloc(sizeof(unsigned char)*8);
            unsigned char *code_buf = (unsigned char *)malloc(sizeof(unsigned char)*12);
            for(k=0;k<10;++k)
            {
                if(k<4)
                {
                    sprintf((unsigned char *)(id_buf+2*k),"%02x",line[k]);
                }
                else 
                {
                    sprintf((unsigned char *)(code_buf+2*k-8),"%02x",line[k]);
                }
            }
            uint32_t id   = (uint32_t)htoi((unsigned char *)id_buf,sizeof(unsigned char)*8);
            uint64_t code = (uint64_t)htoi((unsigned char *)code_buf,sizeof(unsigned char)*12);
            idcode[i][j].id   = id;
            idcode[i][j].code = code; 
            free(id_buf);
            free(code_buf);
        }
    }
    for(i=49990;i<50002;++i)
    {
        printf("new id is %d\n",i);
        for(j=0;j<25;++j)
        {
            printf("id=%d  ",idcode[i][j].id);
            //printf("code=%lu  ",idcode[i][j].code);
            printf("\n");
        }
    }
    uint64_t query_code = idcode[2][0].code;
    int K = 100;
    uint32_t *result = (uint32_t *)malloc(K*sizeof(uint32_t));
    result = process_kgraph(idcode,query_code,K);

    //--------------------------------------------------------------
    //-----process the result and compute precision-----------------
    //--------------------------------------------------------------
    printf("query label is=%d\n",label[idcode[2][0].id]);
    int query_label = label[idcode[2][0].id];
    int error_number = 0;
    for(i=0;i<K;++i)
    {
        if(label[*(result+i)] != query_label)
        {
            error_number++;
        }
        printf("result id=%d,label=%d\n",*(result+i),label[*(result+i)]);
    }

    printf("error_number=%d , precision=%lf\n",error_number,1-(double)error_number/K);


    for(i=0;i<dim1;++i)
    {
        free(idcode[i]);
    }
    free(label);
    printf("hello,word");
}

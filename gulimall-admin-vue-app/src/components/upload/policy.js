import http from '@/utils/httpRequest.js'
export function policy() {
   return  new Promise((resolve,reject)=>{
        http({
            url: http.adornUrl("/provider/upload"),
            method: "post",
            params: http.adornParams({})
        }).then(({ data }) => {
            resolve(data);
        })
    });
}

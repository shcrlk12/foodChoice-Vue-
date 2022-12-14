class axiosUrlChange{
    
    constructor(){
        this.proxyPort = '1110';
    }
    currentLocationUrl(url){
        let result;

        if(url[0] == '/')
            url = url.substr(1);   
        if(window.location.href.includes('localhost') || window.location.href.includes('127.0.0.1')){
            result = `http://localhost:${this.proxyPort}/${url}`;
        }
        else{
            result = `http://3.39.164.70:${this.proxyPort}/${url}`;
            // aws : http://3.39.164.70
            // test : http://115.139.45.137
        }

        return result;
    }
}

export default new axiosUrlChange;
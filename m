Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E597844B0
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Aug 2023 16:49:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 349FD40F51
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Aug 2023 14:49:16 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	by lists.linaro.org (Postfix) with ESMTPS id 19E013F34D
	for <greybus-dev@lists.linaro.org>; Tue, 22 Aug 2023 14:49:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of yuehaibing@huawei.com designates 45.249.212.189 as permitted sender) smtp.mailfrom=yuehaibing@huawei.com;
	dmarc=pass (policy=quarantine) header.from=huawei.com
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RVXGL1lj2zLpFQ;
	Tue, 22 Aug 2023 22:46:02 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 22 Aug 2023 22:49:05 +0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230818124338.37880-1-yuehaibing@huawei.com>
 <2023082220-washbowl-shed-6be9@gregkh>
From: Yue Haibing <yuehaibing@huawei.com>
Message-ID: <db71380f-c84a-5f11-5ec8-4e81a0a061f0@huawei.com>
Date: Tue, 22 Aug 2023 22:49:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2023082220-washbowl-shed-6be9@gregkh>
Content-Language: en-US
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-Rspamd-Queue-Id: 19E013F34D
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:45.249.212.187/29];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:134543, ipnet:45.249.212.0/24, country:CN];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	HAS_XOIP(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: LBSOAGCPCGJ3SM4366NU6JDBXYM5ZNJQ
X-Message-ID-Hash: LBSOAGCPCGJ3SM4366NU6JDBXYM5ZNJQ
X-MailFrom: yuehaibing@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH -next] greybus: svc: Remove unused declarations
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LBSOAGCPCGJ3SM4366NU6JDBXYM5ZNJQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/8/22 22:32, Greg KH wrote:
> On Fri, Aug 18, 2023 at 08:43:38PM +0800, Yue Haibing wrote:
>> Commit 84427943d2da ("greybus: svc: drop legacy-protocol dependency")
>> removed these implementations but not the declarations.
>>
>> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
>> ---
>>  include/linux/greybus/svc.h | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/include/linux/greybus/svc.h b/include/linux/greybus/svc.h
>> index 5afaf5f06856..da547fb9071b 100644
>> --- a/include/linux/greybus/svc.h
>> +++ b/include/linux/greybus/svc.h
>> @@ -100,7 +100,4 @@ bool gb_svc_watchdog_enabled(struct gb_svc *svc);
>>  int gb_svc_watchdog_enable(struct gb_svc *svc);
>>  int gb_svc_watchdog_disable(struct gb_svc *svc);
>>  
>> -int gb_svc_protocol_init(void);
>> -void gb_svc_protocol_exit(void);
>> -
>>  #endif /* __SVC_H */
>> -- 
>> 2.34.1
>>
> 
> Nice, how did you find these?

Just use grep to check like below, then filter out known false item

grep -rP --include=*.h '^(?:\w+\s+){1,3}\*{0,3}\s{0,3}\w+[\t]*\(' * |grep -P -oh '\w+\s*\('|sort| uniq -c| sort -n| grep -P '^\s+1\b'|sed -r -e 's/^\s+1\s+//' -e 's/\(//'|while read line ;
 do
        CNT=`git grep -w $line |wc -l` ;
        if [ $CNT -eq 1 ];then
                git grep -wn $line
        fi
done


> .
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

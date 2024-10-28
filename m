Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13A9B3086
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Oct 2024 13:40:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7FD2244967
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Oct 2024 12:40:47 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id AF35741222
	for <greybus-dev@lists.linaro.org>; Mon, 28 Oct 2024 12:39:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=EefID+DA;
	spf=pass (lists.linaro.org: domain of surajsonawane0215@gmail.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=surajsonawane0215@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20e6981ca77so44991165ad.2
        for <greybus-dev@lists.linaro.org>; Mon, 28 Oct 2024 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119164; x=1730723964; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5Sx48grKqHsy37KXM/hKgSyC5WUqWWqfMWmYpRnhJk=;
        b=EefID+DAlUYpIsl+b5LX2BStl6F5jM5/hfVbD96OLhAGD7OEBLxCvQh/RT83xc6epS
         clQJXcw7kZahB/WHb9E20D/frzpFP/7pZt4/piJEmdfiU/tRc1/HzxQNl+wNmZKa31jr
         M/mLr24J92KGJaMKNzDmIVImiKSBb3KTNoXy2AmNKBE8RpuCyJH7A3VQFi6uP6R523Rm
         84FdMuS7GqvswthaxF+/XycyVo9Kfv3qbw6+ICLpe3CCrC3xjbd/iOrPeMAJWB2GAkhz
         T3r6gQRBzl59qFsVD8r0J4c5RNsFoHgOv6+SywID8QbvaAutYFlRLn4SRMSMLQmcE6WJ
         KTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119164; x=1730723964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5Sx48grKqHsy37KXM/hKgSyC5WUqWWqfMWmYpRnhJk=;
        b=Xj7f7CUtO/R2mZvqlH4XD47voHsRCZ/nIYpIE598fwZPipB4Sg2hWQWWPXF5H98MMk
         iHiobTesTHdiq+t0dFD+dbg7MLm0riKpyt4dt6S1QBhiRPx0jg4yYCJaW3tDQtAfXbUP
         AQwP6WLH8R0/mWf6AZmcMpZ20mdCv/hHbew3Ovk1m01tiXGeRSdF9bIEhJlg106/gCGW
         eZd75cimmwViNniXsIUYCCip49rgyeHnii4K4Jnw944XR9ZvT8r5dmGLBM1ue2kuPYD0
         Rd6t7LZj+UhlkVwMaCtHDKXBefp/wmYJRChBHstxsD5pjVS1+N9pT/oKcwB4I+wApvy6
         ef1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9tL5Vy43aBcBQx0L5tih+x3ihMAtM/l362RczVPd5whADYf+5kb2cAoFPc98VlimCQ19asPJl4woHAw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yyony+joIqcxyNl+da6nsHu4Y1NOKexDsl+Sb8iObfnX2zEhvcv
	ZQ2gaR8pSHv/65lPkbIVvgzFYwHQZVIupkhuja/BO4b/QCiq3K8i
X-Google-Smtp-Source: AGHT+IFAF961EGwJJAgzOy0d64udLQNZhrCkOyeyGuTZN2uShdoAYIVwh5mdVFeMziYjbrJwJt4dsg==
X-Received: by 2002:a17:902:da8f:b0:20b:ce30:878d with SMTP id d9443c01a7336-210c6ae2174mr119702315ad.23.1730119163546;
        Mon, 28 Oct 2024 05:39:23 -0700 (PDT)
Received: from ?IPV6:2405:204:5403:2960:cfd7:84a5:5418:bd66? ([2405:204:5403:2960:cfd7:84a5:5418:bd66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf88490sm49578975ad.114.2024.10.28.05.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 05:39:23 -0700 (PDT)
Message-ID: <7906ba56-e476-4836-ad33-2504b2f635e1@gmail.com>
Date: Mon, 28 Oct 2024 18:09:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>
References: <20241027075304.7301-1-surajsonawane0215@gmail.com>
 <20241027145754.78cff9c4@gmx.net>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <20241027145754.78cff9c4@gmx.net>
X-Spamd-Result: default: False [-9.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[209.85.214.169:from];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.169:from];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmx.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: AF35741222
X-Spamd-Bar: ---------
X-MailFrom: surajsonawane0215@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5KFIDA3HYTLTNRRWYIUSOC4WXTN2GS7J
X-Message-ID-Hash: 5KFIDA3HYTLTNRRWYIUSOC4WXTN2GS7J
X-Mailman-Approved-At: Mon, 28 Oct 2024 12:40:43 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix null pointer dereference in gb_operation_response_send()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5KFIDA3HYTLTNRRWYIUSOC4WXTN2GS7J/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 27/10/24 19:27, Peter Seiderer wrote:
> Hello Suraj,
> 
> On Sun, 27 Oct 2024 13:23:04 +0530, Suraj Sonawane <surajsonawane0215@gmail.com> wrote:
> 
>> Fix an issue detected by the Smatch static tool:
>> drivers/greybus/operation.c:852 gb_operation_response_send() error:
>> we previously assumed 'operation->response' could be null (see line 829)
>>
>> The issue occurs because 'operation->response' may be null if the
>> response allocation fails at line 829. However, the code tries to
>> access 'operation->response->header' at line 852 without checking if
>> it was successfully allocated. This can cause a crash if 'response'
>> is null.
>>
>> To fix this, add a check to ensure 'operation->response' is not null
>> before accessing its header. If the response is null, log an error
>> message and return -ENOMEM to stop further processing, preventing
>> any crashes or undefined behavior.
> 
> False warning (?) as the complete code is as follows:
> 
>   823 static int gb_operation_response_send(struct gb_operation *operation,
>   824                                       int errno)
>   825 {
>   826         struct gb_connection *connection = operation->connection;
>   827         int ret;
>   828
>   829         if (!operation->response &&
>   830             !gb_operation_is_unidirectional(operation)) {
>   831                 if (!gb_operation_response_alloc(operation, 0, GFP_KERNEL))
>   832                         return -ENOMEM;
>   833         }
>   834
>   835         /* Record the result */
>   836         if (!gb_operation_result_set(operation, errno)) {
>   837                 dev_err(&connection->hd->dev, "request result already set\n     ");
>   838                 return -EIO;    /* Shouldn't happen */
>   839         }
>   840
>   841         /* Sender of request does not care about response. */
>   842         if (gb_operation_is_unidirectional(operation))
>   843                 return 0;
>   844
>   845         /* Reference will be dropped when message has been sent. */
>   846         gb_operation_get(operation);
>   847         ret = gb_operation_get_active(operation);
>   848         if (ret)
>   849                 goto err_put;
>   850
>   851         /* Fill in the response header and send it */
>   852         operation->response->header->result = gb_operation_errno_map(errno)     ;
>   853
>   854         ret = gb_message_send(operation->response, GFP_KERNEL);
>   855         if (ret)
>   856                 goto err_put_active;
>   857
>   858         return 0;
>   859
>   860 err_put_active:
>   861         gb_operation_put_active(operation);
>   862 err_put:
>   863         gb_operation_put(operation);
>   864
>   865         return ret;
>   866 }
> 
> Lines 829-833 make sure that in case of '!gb_operation_is_unidirectional()'
> 'operation->response' is allocated (in case of failure early return with
> 'return -ENOMEM')
> 
> Lines 842-843 do an early return in case of 'gb_operation_is_unidirectional()'
> 
> So no chance to reach line 852 without 'operation->response' is allocated...
> 
> Regards,
> Peter
> 
>>
>> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
>> ---
>>   drivers/greybus/operation.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
>> index 8459e9bc0..521899fbc 100644
>> --- a/drivers/greybus/operation.c
>> +++ b/drivers/greybus/operation.c
>> @@ -849,7 +849,13 @@ static int gb_operation_response_send(struct gb_operation *operation,
>>   		goto err_put;
>>
>>   	/* Fill in the response header and send it */
>> -	operation->response->header->result = gb_operation_errno_map(errno);
>> +	if (operation->response) {
>> +		operation->response->header->result = gb_operation_errno_map(errno);
>> +	} else {
>> +		dev_err(&connection->hd->dev, "failed to allocate response\n");
>> +		ret = -ENOMEM;
>> +		goto err_put_active;
>> +	}
>>
>>   	ret = gb_message_send(operation->response, GFP_KERNEL);
>>   	if (ret)
> 
Hello Peter,

Thank you for the feedback. I understand your point about the existing 
checks ensuring operation->response is allocated before line 852. It 
seems this might have been a false positive from the static analysis tool.

Once again, thank you for your time and consideration.

Best,
Suraj
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

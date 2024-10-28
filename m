Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB359B30D2
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Oct 2024 13:47:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7D68C4497B
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Oct 2024 12:47:11 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	by lists.linaro.org (Postfix) with ESMTPS id 69B32440E8
	for <greybus-dev@lists.linaro.org>; Mon, 28 Oct 2024 12:46:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=gGEtMjgp;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.50 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-83a9be2c0e6so160931339f.2
        for <greybus-dev@lists.linaro.org>; Mon, 28 Oct 2024 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1730119603; x=1730724403; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gqziD48iJSw59sUbg1Xn4EgpxjmEAikt0eo9LrL6y0=;
        b=gGEtMjgpggWWQ4bRHPzrEnE7bd5eBNfGSSmCN2ZBVhjC2J2eGUF9ZOnkOCA/1ia91Z
         R0lVNJ1l99kzRfbsNBwFs7h3AsCxhu1rXlijciTDilJ3bHgbb3YjMtaT5TpjBJlqeyUF
         ZzfYsU5H5EGp2EHJrXsIcUXxkI49/PE9IP7IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119603; x=1730724403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gqziD48iJSw59sUbg1Xn4EgpxjmEAikt0eo9LrL6y0=;
        b=dJb2XCSPD8mvVbZh84ouqqKdRwHltDhU39HxvZRVmcqsLDRqd29S7O9A3GZhDTFHJ/
         ZN3KEx8dEcAMfBFcS6YVGriuZDk2lxG8lTJ0ZXtSwwroNIfujy/Y7wZFsMxln0ZQyAWR
         lY4zTvIPhBV4b+tnIVWvicc/wt6OxhByKlQYDrkjaKPbHV80GqiP81EzjK5ijB7l7vG0
         HaPwF1Db0YiAdjBBxqF2bdlWXuIW/OPdlRKROEH7CoE2tx9HtsWabJx/bstMf0l5G8d8
         PbmBzdM6kXjl1d9ptTQIjGqLifuiHxh5OzpUXlNjg0ZnKET6RejfKVLJcbxGrdIFefHD
         AjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHz5w1dEBEcc35gFAOBBx1JzyBME6cj8bpdAr6KBBUzY342USv1ryiO0M+NlJ5lw5LiHBpFteYBzc5Sw==@lists.linaro.org
X-Gm-Message-State: AOJu0YxjLOOywub5Mrf+l39bOJiHS5lSCcQB7H+FyDSSgL6E9PP95FFX
	WjrhEq9cfYUAmt7ixQjEtJVFLrqFqWfkLkoGmMssoRv76iRzbhhpew64Rh9Ggg==
X-Google-Smtp-Source: AGHT+IFk2W9xgzmvAPsM1lDa+gdwQgC9agSg3N6MCb5OTtBXYvgbyYC2xFyDB09UbFic7ODwjwJ3bg==
X-Received: by 2002:a05:6602:6002:b0:83a:a96b:8825 with SMTP id ca18e2360f4ac-83b1bcefdebmr750425039f.0.1730119602691;
        Mon, 28 Oct 2024 05:46:42 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4dc725eb4fcsm1664421173.36.2024.10.28.05.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 05:46:42 -0700 (PDT)
Message-ID: <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
Date: Mon, 28 Oct 2024 07:46:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>, Yi Yang <yiyang13@huawei.com>
References: <20241026081153.2649890-1-yiyang13@huawei.com>
 <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.50:from];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.166.50:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,projectara.com,lists.linaro.org,lists.linux.dev,huawei.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 69B32440E8
X-Spamd-Bar: --
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZEHT2LM73CVSBNPXZFMLHVE272D5P4Q4
X-Message-ID-Hash: ZEHT2LM73CVSBNPXZFMLHVE272D5P4Q4
X-Mailman-Approved-At: Mon, 28 Oct 2024 12:47:04 +0000
CC: johan@kernel.org, elder@kernel.org, ankov_svetlin@projectara.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, wangweiyang2@huawei.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix possible null-ptr-deref in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZEHT2LM73CVSBNPXZFMLHVE272D5P4Q4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/26/24 5:50 AM, Dan Carpenter wrote:
> On Sat, Oct 26, 2024 at 08:11:53AM +0000, Yi Yang wrote:
>> The gb_audio_manager_get_module() is EXPORT_SYMBOL, and will return NULL
>> when incoming parameter id < 0, fix possible null-ptr-deref by add check
>> for return value.
>>
>> Fixes: 8db00736d365 ("greybus: audio: Add Audio Manager")
>> Signed-off-by: Yi Yang <yiyang13@huawei.com>
> 
> Where is gb_audio_manager_get_module() called from?  So far as I can see it's
> never used.  Why not just delete it?
> 
> regards,
> dan carpenter

I agree with this.  I suspected all callers might have guaranteed
that the "id" value passed would be always valid, but... there are
no callers.

It is a simple function, and could be added back again if it is
needed in the future (possibly even by reverting the commit that
removes it).

If you do this, please remove gb_audio_put_module() in the same
patch.  It too has no callers.

Thank you.

					-Alex
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

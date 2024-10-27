Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B4F9B1DFB
	for <lists+greybus-dev@lfdr.de>; Sun, 27 Oct 2024 15:02:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2AC15442FA
	for <lists+greybus-dev@lfdr.de>; Sun, 27 Oct 2024 14:02:01 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	by lists.linaro.org (Postfix) with ESMTPS id 27BC840C46
	for <greybus-dev@lists.linaro.org>; Sun, 27 Oct 2024 14:00:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=SscjLse3;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.48 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-83aba65556cso144731039f.3
        for <greybus-dev@lists.linaro.org>; Sun, 27 Oct 2024 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1730037645; x=1730642445; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gDtIO9biG3LuVSVqi5dhsp4ov2sWS6eGJBXEdghply0=;
        b=SscjLse3EsSTDndl4bN75Syg369ezzOFAWHS6eF3zNiLaDUO3yAeovA5KG21tsyMSd
         BdPmUsQ+XZ2UiVs3qnffQ1sUeaaoKtc/8NtUbZP2pGffhOyq3pNYNgowpaNJzDInjpHP
         DDZuYB0zIBcsG1vso79JEwjfztYuYFeFOb7hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730037645; x=1730642445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDtIO9biG3LuVSVqi5dhsp4ov2sWS6eGJBXEdghply0=;
        b=ZuXT4lBIpRGsXx4UsfG3u8RdKeLsNeD8sOpzYIrX93DRuraiu325C5Nh/zin+pya/W
         NeZHoR0xA8aGgWYBHIq8uz6dGuunmzmWZVcvOy5EtZ55yLIEBCp9ABlHDOLCOyXa6EYD
         L2LaecdPjLLoRj7H6UXguF5S91+VaRLsVY8/mPWwn3HVXPDtIVNzVJeBjJ/Z7ofYvrPL
         e4h4PaU726g1iClnhQtxmhE6DVqhZZHHSkhk7yAoo+1MGt3MwFANmZnSWV7lbefFhC/s
         YEv30Y1Owcy/gEtk4ztTst2fek4mWEf5AdI2FFhxprxfrYvCjMERCZlqEqYMjM6Uez4G
         KqsA==
X-Gm-Message-State: AOJu0YwxGB3MgQnPrv+KaFmhFw/jpQq4pb41NpE9/0OCYjkM1QObhMWq
	8mIdnY1/MYz6nUaq9u5OwwfuxbUJsq+ha3pcdKiumazFHDeGb2dYOVb8Qpxi5A==
X-Google-Smtp-Source: AGHT+IF9RJ+pjofmPm2SqDUnt4GShxn01jUlKEdZotXvqANIPexEfcBxmSfD4FbqCLjoIoJ+M8Z6uA==
X-Received: by 2002:a05:6602:2d81:b0:83a:a82b:f856 with SMTP id ca18e2360f4ac-83b1c3f4053mr425316239f.3.1730037644863;
        Sun, 27 Oct 2024 07:00:44 -0700 (PDT)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4dc72610be1sm1190339173.42.2024.10.27.07.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 07:00:44 -0700 (PDT)
Message-ID: <106ff2db-befc-4899-8f28-6f8b6276cdd3@ieee.org>
Date: Sun, 27 Oct 2024 09:00:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suraj Sonawane <surajsonawane0215@gmail.com>, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org
References: <20241027075304.7301-1-surajsonawane0215@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20241027075304.7301-1-surajsonawane0215@gmail.com>
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.48:from];
	TO_DN_SOME(0.00)[];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.166.48:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 27BC840C46
X-Spamd-Bar: ----
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VZTG6I7HSWVY5PAKJ2IFHNRTRPWZJNIA
X-Message-ID-Hash: VZTG6I7HSWVY5PAKJ2IFHNRTRPWZJNIA
X-Mailman-Approved-At: Sun, 27 Oct 2024 14:01:48 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix null pointer dereference in gb_operation_response_send()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VZTG6I7HSWVY5PAKJ2IFHNRTRPWZJNIA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/27/24 2:53 AM, Suraj Sonawane wrote:
> Fix an issue detected by the Smatch static tool:
> drivers/greybus/operation.c:852 gb_operation_response_send() error:
> we previously assumed 'operation->response' could be null (see line 829)

There is no need for this.  This is a case where the code is
doing something that is too involved for "smatch" to know
things are OK.

A unidirectional operation includes only a request message, but
no response message.

There are two cases:
- Unidirectional
   - There is no response buffer
   - There will be no call to gb_operation_response_alloc(),
     because the operation is unidirectional.
   - The result gets set with the errno value.  If there's
     an error (there shouldn't be), -EIO is returned.
   - We return 0 early, because it's a unidirectional operation.
- Not unidirectional
   - If there is a response, we attempt to allocate one.  If that
     fails, we return -ENOMEM early.
   - Otherwise there *is* a response (it was successfully allocated)
   - The result is set
   - It is not unidirectional, so we get a reference to the operation,
     add it to the active list (or skip to the end if not connected)
   - We record the result in the response header.  This is the line in
     question, but we know the response pointer is good.
   - We send the response.
   - On error, we drop or references and return the error code.

					-Alex



> The issue occurs because 'operation->response' may be null if the
> response allocation fails at line 829. However, the code tries to
> access 'operation->response->header' at line 852 without checking if
> it was successfully allocated. This can cause a crash if 'response'
> is null.
> 
> To fix this, add a check to ensure 'operation->response' is not null
> before accessing its header. If the response is null, log an error
> message and return -ENOMEM to stop further processing, preventing
> any crashes or undefined behavior.
> 
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> ---
>   drivers/greybus/operation.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 8459e9bc0..521899fbc 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -849,7 +849,13 @@ static int gb_operation_response_send(struct gb_operation *operation,
>   		goto err_put;
>   
>   	/* Fill in the response header and send it */
> -	operation->response->header->result = gb_operation_errno_map(errno);
> +	if (operation->response) {
> +		operation->response->header->result = gb_operation_errno_map(errno);
> +	} else {
> +		dev_err(&connection->hd->dev, "failed to allocate response\n");
> +		ret = -ENOMEM;
> +		goto err_put_active;
> +	}
>   
>   	ret = gb_message_send(operation->response, GFP_KERNEL);
>   	if (ret)

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMgTLMXGt2kRVQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 10:00:53 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DC929693C
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 10:00:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9E7F23F70C
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 09:00:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	by lists.linaro.org (Postfix) with ESMTPS id 5C6063F6F0
	for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 09:00:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=dbUzoc7t;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.54 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so42956185e9.3
        for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773651644; x=1774256444; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m2uQ6cvlypnVHsVAo9AGgQ4YcUxa4jo4S97am47FBUQ=;
        b=dbUzoc7t21upVPjoNFd9WeT04n9Q7VhTn6i6CgS2bpEf11Oph/XADIpMoxHA8n0Jng
         UjZK5I7/6bUUHggKu5AVQTIqrOGdU/W5U77nMM1kT6Ugw/48XtqtBAKNax129w8gLzZf
         etgxej4DXaHN8BGcGyGWviZF/FfCjEZyZdxZktqEQYGlnCTyoWU3V/eDzhK60RFxEkAY
         YFksqoITOLHigHgaJ3o6Gg5DC+eDwKZ/aIpXvh97QQK5PiHcfZ+FXI1shLq5XItQ7VoX
         m6PlkUuqZzYoCTfrJv/BWF6f5so8XD8ZzMDNQyRVFnEQXynY3izNYBswTuLQhnncsyw5
         288g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651644; x=1774256444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2uQ6cvlypnVHsVAo9AGgQ4YcUxa4jo4S97am47FBUQ=;
        b=V0qz6MoFuNPu0hzG8FbuMBQeZCgfXbiwz5MV8xqNoJTxuWTrIXE9eT8kKiaEjrwfEt
         9OUa/f8/ZPrc3gfSaIcs1RyUlXJa1hKENxY8dOMPenUyDRyLtf8OcgrcJuUAWg/Y2JRn
         Q9hixev8du6lbsTqfl2198P1NNzjo/J3cIy/9QLfmfuAnvWst03uQex0U9sMlz8e9PXO
         bCdcPOWyf+NxWWmVYYbUnxQNDOJ76BKMfijxUz5+5DeSPr/r7+YD2PpjhNWHrnLgMETv
         zPb0fVaUSRmPJ6cnOcuGJ+LYtDofQ76R4hsG6ALMRsWwr3ECoGkmp1yn9UIU9KnmVA6I
         QMMw==
X-Forwarded-Encrypted: i=1; AJvYcCUqjt5fjkR0bmQ8GOr5jveJPadiUMPwLGby7GMki7zAxH5wTNQpwG8hzpXno/yMVsJztagLQlrvkHsFpg==@lists.linaro.org
X-Gm-Message-State: AOJu0YwxuLL6O4gASPbeVag73VxQzTu7YuHDOwbpMkeQV53jqDo7kVnN
	NSoAp/1m/rrpuN6D1UgAv3ov44rY1yrtncxt+a14++k16X09VTHkoA6050J+kU6d11WZ3g==
X-Gm-Gg: ATEYQzwOcGVCyFcf1JORdVpDBEgGXKGvb/z4R8LXIkTwdDqtthq8vvbXsjUmYLzH8k/
	njAEcE+Mbt0mpVuWPW9V1G1XONcfK4S6u+ud8qQlN42cg6BQnQnxuvtJQ/eJKNwA/29PL8+9LIF
	VvHZ6hcxkpUS6zZvtUeRxxy9eXSrecoYN0bKD/mPDq7yec7zZ9dLwQe6hyL5PPqnbYKDNEAt/dz
	svi0Njbv9taVD9yRBrRFJdYv4Akg3VwJUtMPvIeOQFLsv/Ise3A0oe3HKdh1NRBdnrtA0zfaZ5U
	k8peSeIX2RrV/dTqhsUmlEeInlYqVc7TnP5Fq+gkNKzMI04xOUZIFuqcEvkKMUWADqYsjWTjunJ
	2yF1qy9z9+sc7jTBjt1TsZAD3Ahieuin/DLX+4jpP+DN7hFkadiActmVXWgwO/GLG0TZTBSDA/X
	UfqJ20gNXE8WFpSfdDaaxezsehZ0EV
X-Received: by 2002:a05:600c:3550:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4855670c971mr216147815e9.29.1773651644178;
        Mon, 16 Mar 2026 02:00:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm504391785e9.3.2026.03.16.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:00:43 -0700 (PDT)
Date: Mon, 16 Mar 2026 12:00:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oarora Etimis <oaroraetimis@gmail.com>
Message-ID: <abfGuD0O8iiwHQUn@stanley.mountain>
References: <20260315231949.231320-1-OaroraEtimis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260315231949.231320-1-OaroraEtimis@gmail.com>
X-Spamd-Bar: ----
Message-ID-Hash: UDWLKBWSDBS2X55AZYCHUEOMJWGKGJPJ
X-Message-ID-Hash: UDWLKBWSDBS2X55AZYCHUEOMJWGKGJPJ
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 2/2] staging: greybus: bootrom: fix potential null pointer dereference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UDWLKBWSDBS2X55AZYCHUEOMJWGKGJPJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.207];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[oaroraetimis.gmail.com:query timed out,greybus-dev.lists.linaro.org:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 96DC929693C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 07:19:49AM +0800, Oarora Etimis wrote:
> In gb_bootrom_get_firmware(), the 'fw' pointer could be NULL if the
> function jumps to the 'unlock' label. The execution flow continues
> into the 'queue_work' block where 'fw->size' is accessed, leading to
> a null pointer dereference.
> 
> Fix this by adding a NULL check for 'fw' before accessing its members.
> 
> Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
> ---
> Changes in v2:
> - Rebased onto the latest staging-next branch to resolve merge conflicts.
> - No logical code changes.
> 
>  drivers/staging/greybus/bootrom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c322..50c80475d241 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
>  
>  queue_work:
>  	/* Refresh timeout */
> -	if (!ret && (offset + size == fw->size))
> +	if (!ret && fw && (offset + size == fw->size))

This seems like a static checker false positive.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

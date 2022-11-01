Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB561546D
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Nov 2022 22:49:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2D5393E89F
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Nov 2022 21:49:29 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	by lists.linaro.org (Postfix) with ESMTPS id EB69F3E89F
	for <greybus-dev@lists.linaro.org>; Tue,  1 Nov 2022 21:49:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=XLf9q+Yr;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.53 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f53.google.com with SMTP id d123so8797376iof.7
        for <greybus-dev@lists.linaro.org>; Tue, 01 Nov 2022 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HejXL+J+QIXG9aHFC0KatU8gI5T0S5HF7LycLEhYP4k=;
        b=XLf9q+YrCpSEojPiWImV+o706LQsz4Os76EOGQVTew1FOVpxlUxe35X0D2L7oB1Q/9
         jK/dn/Fu2f7d5Y+UcN2IJg579s78sTn/J8gLb+Zu/5T+GFkonpTle7ch8HvdxsLgn6IG
         AJGAJKmnFena6VCJCjNReK7oyjMu/bZF5gXC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HejXL+J+QIXG9aHFC0KatU8gI5T0S5HF7LycLEhYP4k=;
        b=J2hv3j1hJaCpUHiWeICzGcoGP5KrJfB6RVFIcg6BfPmCq0Csfqp80Szxo666O7em2s
         wMliceG24TFMtvLtcwUGd55MptFhU4LA1YAiOKSHO3H0Ih/AGy7OTREfl6W3uDnlEnq5
         6TD/Dth7+ydwwLA6PSPh/VxzIO3C4Mg9mfj4t5oIFbPkwa2A1SiC8BgkoH9Flq2VO7rL
         hPx2l5iAO6X8WVSkvXQ4SM+xbs5f1qNkLyxUoJGqQLn8sTuF83nejcVoo/oleAJt3J6T
         tAMgMc9fZjjypyPxJTJsazqUXbxgS+8GLsVYnql6QJ9BRQicNKouW2tSwH2nr0bHZOYB
         EAZw==
X-Gm-Message-State: ACrzQf0aAUGTrdUijRT0Y1lHyLoawBOK0dn/QYTX7mggWsLjYo3ZTRtS
	OrNENYPN1wqbNeaI+ucC7Gga4Q==
X-Google-Smtp-Source: AMsMyM6/m1cWkL+Pw6gKRxAuWst0ALy4aPYsPZTBDrZ3EqaBRU9Qibe+PqUodJI1JL0JjikvxtZvrQ==
X-Received: by 2002:a02:94cf:0:b0:363:4a26:8cff with SMTP id x73-20020a0294cf000000b003634a268cffmr13638400jah.286.1667339362369;
        Tue, 01 Nov 2022 14:49:22 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id t11-20020a6bc30b000000b006bc53dd917fsm4327045iof.51.2022.11.01.14.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 14:49:21 -0700 (PDT)
Message-ID: <a20c1378-926e-2f69-1473-fb654fd035f7@ieee.org>
Date: Tue, 1 Nov 2022 16:49:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
 <ebf1e6988a53a455990230a37cf759ee542ea7ec.1667336095.git.christophe.jaillet@wanadoo.fr>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ebf1e6988a53a455990230a37cf759ee542ea7ec.1667336095.git.christophe.jaillet@wanadoo.fr>
X-Rspamd-Server: lists.linaro.org
X-Spamd-Bar: ----
X-Rspamd-Queue-Id: EB69F3E89F
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[wanadoo.fr,kernel.org,linuxfoundation.org];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[ieee.org:+];
	RCVD_COUNT_THREE(0.00)[3];
	URIBL_BLOCKED(0.00)[ieee.org:dkim];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.53:from]
Message-ID-Hash: 4SNLIQN6TIIMPYTVB2FLSO7CMMKDXFW6
X-Message-ID-Hash: 4SNLIQN6TIIMPYTVB2FLSO7CMMKDXFW6
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 11/30] greybus: svc: Use kstrtobool() instead of strtobool()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4SNLIQN6TIIMPYTVB2FLSO7CMMKDXFW6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 11/1/22 4:13 PM, Christophe JAILLET wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks OK to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
> This patch is part of a serie that axes all usages of strtobool().
> Each patch can be applied independently from the other ones.
> 
> The last patch of the serie removes the definition of strtobool().
> 
> You may not be in copy of the cover letter. So, if needed, it is available
> at [1].
> 
> [1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
> ---
>   drivers/greybus/svc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
> index 56d2b44d6fef..16cced80867a 100644
> --- a/drivers/greybus/svc.c
> +++ b/drivers/greybus/svc.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/debugfs.h>
> +#include <linux/kstrtox.h>
>   #include <linux/workqueue.h>
>   #include <linux/greybus.h>
>   
> @@ -83,7 +84,7 @@ static ssize_t watchdog_store(struct device *dev,
>   	int retval;
>   	bool user_request;
>   
> -	retval = strtobool(buf, &user_request);
> +	retval = kstrtobool(buf, &user_request);
>   	if (retval)
>   		return retval;
>   

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

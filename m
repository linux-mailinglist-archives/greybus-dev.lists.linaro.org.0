Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E486CB007
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Mar 2023 22:34:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5BC4743CDD
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Mar 2023 20:34:28 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	by lists.linaro.org (Postfix) with ESMTPS id E6D543E950
	for <greybus-dev@lists.linaro.org>; Mon, 27 Mar 2023 20:34:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=cBRSQ0Nb;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.174 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f174.google.com with SMTP id h14so3925741ilj.0
        for <greybus-dev@lists.linaro.org>; Mon, 27 Mar 2023 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1679949261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaePAyDz2w86nDPVu8ko8gEeQEmQvefWooibL8cU7/M=;
        b=cBRSQ0NboIQu833svXwTdI1bXDAJHNRXztPlTf5B0zEaUumceNVjYyU/POtvqU7tNM
         WOh6QqDucfo/0SPZueviKzYA2a3oh8OI16MbGkKEWehM8OFZOEkcAWRBoTNF2s4/hGtk
         7xBpImWCWB/BQrKtV1egRT5K40J1dKhpVtEmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679949261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SaePAyDz2w86nDPVu8ko8gEeQEmQvefWooibL8cU7/M=;
        b=FQUkHwEdGXbP9uq1tYkLQmC0sXNnvqZwsXgprkQM5H/U3+NW5Yr7Qz+iN31zETIWAZ
         qyG9UsW3UuOLU77aDBXcohmL79figMRq8GUJWgn+bPUW31BXlUV5Kg1LExvq1M0MczTx
         6a37bSBFMCNv+StYPxpG0CSLA42aPorQNUvaweGT5VRdO3lENqyCwErAztql3i8VG5dh
         /drEEPhizU+8sX/idUMN2S+Yachd9kFrdaFAEPlG5yD7smjpPxYmODoabJmIN4a4VWAi
         JeqA/qJfsNC6pfE7B43hFz/Eik5/EK4RbDvkIY2eenXJ4AjoYKyFnL7yvwM/xSYeoCNM
         FHOw==
X-Gm-Message-State: AAQBX9ejb5KxKc8DDlFT+hFUNvhIU1MliC79JHz0HvKc7jGYFxcfGTjU
	KrufyZn4JbxX556pvqAkD0xwOw==
X-Google-Smtp-Source: AKy350ZkYV9vty3O2CTGB8EoQNeAJarHBPdwy546ZGbZ39Z2XXxigHGLg+w0DT/Ndbp5TParI+FLnw==
X-Received: by 2002:a92:c501:0:b0:317:3f4:c06c with SMTP id r1-20020a92c501000000b0031703f4c06cmr9631918ilg.20.1679949261242;
        Mon, 27 Mar 2023 13:34:21 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id y16-20020a027310000000b004061d6abcd1sm9125305jab.162.2023.03.27.13.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 13:34:20 -0700 (PDT)
Message-ID: <37dc9fe2-cdc8-ea7b-c7b4-89415c3cda8f@ieee.org>
Date: Mon, 27 Mar 2023 15:34:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev
References: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E6D543E950
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[98.61.227.136:received];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.166.174:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,mail-il1-f174.google.com:helo,mail-il1-f174.google.com:rdns,ieee.org:dkim];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.174:from];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: Y3YPP6IRFP2CGO2SQNAOHHL5MRRGWRGF
X-Message-ID-Hash: Y3YPP6IRFP2CGO2SQNAOHHL5MRRGWRGF
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: refactor arche_platform_wd_irq() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Y3YPP6IRFP2CGO2SQNAOHHL5MRRGWRGF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/27/23 3:18 PM, Khadija Kamran wrote:
> Refactor function by adding goto statement. This reduces the
> indentation and fixes the issue reported by checkpatch.pl script.
> 
> "CHECK: line length of 101 exceeds 100 columns"

Looking at this entire function, it seems a great deal of it
has somewhat wide lines.  Part of the problem is that it
relies on arche_platform_set_wake_detect_state(), which is
36 characters long all by itself.

In any case, the line that is identified is the widest, of
course, by 10 or more characters.  But changing that one
line doesn't substantially improve things.

I'm reluctant to suggest this, because I don't want a lot
of "code churn" patches to follow based on this, but...

One could rename arche_platform_set_wake_detect_state()
to be just set_wake_detect_state().  It's private to
its source file (arche-platform.c) and therefore the
"arche_plaform_" prefix isn't really necessary.  And
perhaps the result would be code that is a little more
readable, because its lines aren't so long.

I'd be happy to hear others' thoughts on this.

					-Alex



> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>   drivers/staging/greybus/arche-platform.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index fcbd5f71eff2..c7d3b6f7368f 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -178,11 +178,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>   				 */
>   				if (arche_pdata->wake_detect_state !=
>   						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> -							       flags);
> -					return IRQ_WAKE_THREAD;
> +					goto out;
>   				}
>   			}
>   		}
> @@ -205,6 +201,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>   	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
>   
>   	return IRQ_HANDLED;
> +
> +out:
> +	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> +	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> +	return IRQ_WAKE_THREAD;
>   }
>   
>   /*

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

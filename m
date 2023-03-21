Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D13ED6C39E2
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DAF2E3EBA6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:57 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	by lists.linaro.org (Postfix) with ESMTPS id 2F3F03EBA6
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 16:21:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=TP7xcMAp;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.208.47 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id ek18so61913214edb.6
        for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 09:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679415698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lN54tDUmXf9hwv+PXMNCl+jsvxs7b+LzMxVySPVN8ik=;
        b=TP7xcMAp4UQxJz2ItJv3FiZYU+VFst7DjGgMIXfyglYpdwVEdVDe03mdwalZVRAzcJ
         XKpUZ1MP82LkAsPWPjKY29lBDwMQSzhIjnF7LV7TzlLXf4Ad9f/qOf/NEs1Tf7vUDBhl
         VNVz4ccP4nCVi+i7jH9H8m+/VTzwGF01Za/sFk7gVV8EMFc2gIi89YkGHXRdfpPxOtM5
         sL9KLhhIJ8nZTPR4bys4F5iwSbmUAbEyqoI8lCbsbznO4xrtzLvd+gDp0XRI6IStzUxe
         yuCU1diSGOVnsU75ns8aRPohEq6t/mJQVoXmNKjDk03CYHEo6V+CHF14f9Qhu2tLrcZO
         hnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679415698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lN54tDUmXf9hwv+PXMNCl+jsvxs7b+LzMxVySPVN8ik=;
        b=DEFE+SoHVLj5sVHgT/+rtjQXzDlL4HO6cnXKXpCqGDRsVcJMDxwUuwEj2cR2SOSwL8
         mShPZefEpF+2v0Vp4c1VHsqw2NtwuxsAqHmCkRk/7ypXKzBLUXlxFDTdlCNnmwKWGb8h
         0Pcr161sprjpH5gzm20yAp1jkFIzlI7aTNKQeDS2C9U+PI5pLF5qtZ/+vyVJGUW6bwd2
         cChyXYA1w75yZtYydmqlcFbh9oUZopjhgzK36E+fcXpijrcRKgS6Kf0Vz+nWbe6pKPs3
         rDgzzerI8ZWDhsHC7f1FTS4CYuZ3sVQmM6pxYw0ojRQKhJOHo36s3NDMb+bJTzIYlYXF
         Q2og==
X-Gm-Message-State: AO0yUKWOifzpPNCRpXwYOy3Zxa82WbalOYhYHpd5xPcGUcibph2t2A9W
	h+C2pD1fTWzG2tvnaMYqOrw=
X-Google-Smtp-Source: AK7set9n+TEYOTN5JF+wpsOMVpXYpeA2AgUrMGIGu3uxrhtF1oKub2rMRl/BdhdUV2wyGEenG8Sf2A==
X-Received: by 2002:a17:906:d14d:b0:931:de86:1879 with SMTP id br13-20020a170906d14d00b00931de861879mr3945437ejb.9.1679415698145;
        Tue, 21 Mar 2023 09:21:38 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id v19-20020a1709067d9300b008cff300cf47sm5977472ejo.72.2023.03.21.09.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 09:21:37 -0700 (PDT)
Date: Tue, 21 Mar 2023 21:21:35 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Message-ID: <ZBnZj3JbTOsplHvw@khadija-virtual-machine>
References: <ZBgYsqkpdYpGQniB@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZBgYsqkpdYpGQniB@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2F3F03EBA6
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.50 / 15.00];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.47:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: X7KG3Y5GV5T5H5QK3P7J6FI4S55PHLAI
X-Message-ID-Hash: X7KG3Y5GV5T5H5QK3P7J6FI4S55PHLAI
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:07 +0000
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: merge split lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X7KG3Y5GV5T5H5QK3P7J6FI4S55PHLAI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 20, 2023 at 01:26:33PM +0500, Khadija Kamran wrote:
> If condition and spin_unlock_...() call is split into two lines, merge
> them to form a single line.
> 
> Suggested-by: Deepak R Varma drv@mailo.com
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
> 
> Changes in v3:
>  - Removing tab to fix line length results in a new checkpatch warning,
>    so let the fix length be as it is.
> Changes in v2:
>  - Rephrased he subject and description
>  - Merged if_condition() and spin_unlock...() into one line
>  - Link to patch:
>  https://lore.kernel.org/outreachy/ZAusnKYVTGvO5zoi@khadija-virtual-machine/
> 
> Link to first patch:
> https://lore.kernel.org/outreachy/ZAtkW6g6DwPg%2FpDp@khadija-virtual-machine/
> 
>  drivers/staging/greybus/arche-platform.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index fcbd5f71eff2..6890710afdfc 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -176,12 +176,10 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				 * Check we are not in middle of irq thread
>  				 * already
>  				 */
> -				if (arche_pdata->wake_detect_state !=
> -						WD_STATE_COLDBOOT_START) {
> +				if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
>  					arche_platform_set_wake_detect_state(arche_pdata,
>  									     WD_STATE_COLDBOOT_TRIG);
> -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> -							       flags);
> +					spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
>  					return IRQ_WAKE_THREAD;
>  				}
>  			}
> --
> 2.34.1
>

Hey Outreachy Mentors,

Kindly take a look at this patch and let me know if it is okay to work
on this file or should I look for other cleanup patches.

Thank you for your time.
Regards,
Khadija

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

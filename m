Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2705238977F
	for <lists+greybus-dev@lfdr.de>; Wed, 19 May 2021 22:06:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8734B6114C
	for <lists+greybus-dev@lfdr.de>; Wed, 19 May 2021 20:06:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1816A61170; Wed, 19 May 2021 20:06:50 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5225C6114A;
	Wed, 19 May 2021 20:06:47 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0C10D60572
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 20:06:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 009AF610EC; Wed, 19 May 2021 20:06:45 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by lists.linaro.org (Postfix) with ESMTPS id EAD8A60572
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 20:06:43 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id z1so13345121ils.0
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 13:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yZeOnuZeT/FAFpEU8iKvZOWrDJSy1lQIQkosiknz+tw=;
 b=B4L4Cf4ob7jI8O9tCpuGsSoGTTsYT8cNP5C9LiGilDHx9PkhpMToY9/1ewEkYXeKHj
 W3jdPK68fcLfLZGyadnqvj01SLWr2Eb73VBvpyJD+DHI0LHr0rY0JI/7Vea++hnf8wA2
 tn6oQnUx4SLKT/CFbkcyjDyq5A/I/Rs1GTu4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yZeOnuZeT/FAFpEU8iKvZOWrDJSy1lQIQkosiknz+tw=;
 b=sRs6qBo6HEk6nmu6tkUcA01ida2dpS++feGRQQvE7GX0KPaX2lNUC/PIU2V9U0EkpX
 pAAyxTtlaVKeJqVP+wFIcOvmRbr9Df5mDO/Gzc8+nHFkE/Qy8ZbU/p7ygJ7nxZUI3WPt
 k/X1glv8UPM519ZsKGz3JqubPBEIJ/zdoQFxMEsWnlAbGpNfeMDPkOxvh8m/TevjiMND
 lEO2gFDANT0A2QDJYc1hypIm5bOco/gCi8FmL0j6ugG3o3we34XsMiP9nP3AO/+/XnUv
 cTXn1AMhYBCYn2QeZbSViAPv8k1ML23uPL5ayYMlxwGEtB2y44M/mFgBcH6QA4XpUrNT
 GhAw==
X-Gm-Message-State: AOAM530Yndj0HrY8xCJwv7G+gqyPUWG4YgoqIFkdgX7bKLTxb05PaeYT
 hlQyYlyHedDi2lTaJ62gP31y0g==
X-Google-Smtp-Source: ABdhPJyMEwvEgzqb8XIl+iED4/ZpznyOYcX85jjsq1lC52oKNgGcLJYBNbDvhDFAMFiGWRJzkYm2+w==
X-Received: by 2002:a92:3f08:: with SMTP id m8mr884825ila.154.1621454803442;
 Wed, 19 May 2021 13:06:43 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id v2sm577049ioh.14.2021.05.19.13.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 13:06:42 -0700 (PDT)
To: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org
References: <20210519181938.30813-1-asha.16@itfac.mrt.ac.lk>
From: Alex Elder <elder@ieee.org>
Message-ID: <4af943f6-9baa-72a6-12b5-6b35179a7019@ieee.org>
Date: Wed, 19 May 2021 15:06:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519181938.30813-1-asha.16@itfac.mrt.ac.lk>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH V2] Staging: greybus: fix open parenthesis
 error in gbphy.c
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 5/19/21 1:19 PM, F.A.Sulaiman wrote:
> This patch fix "Alignment should match open parenthesis" checkpatch error.
> 
> Signed-off-by: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>

I have mixed feelings about this one.  This alignment rule
is fine, but I personally don't think it improves things.

Aside from that, there are a few more places in the Greybus
code that lead to exactly this warning.  So I guess, if we're
going to have the code follow this alignment rule, why not
just fix all spots at once (i.e., in a patch series)?

Anyway, I'll offer this, but perhaps others can provide
their opinion.

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/gbphy.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index 9fc5c47be9bd..13d319860da5 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -27,7 +27,7 @@ struct gbphy_host {
>   static DEFINE_IDA(gbphy_id);
>   
>   static ssize_t protocol_id_show(struct device *dev,
> -				 struct device_attribute *attr, char *buf)
> +				struct device_attribute *attr, char *buf)
>   {
>   	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
>   
> @@ -221,7 +221,7 @@ void gb_gbphy_deregister_driver(struct gbphy_driver *driver)
>   EXPORT_SYMBOL_GPL(gb_gbphy_deregister_driver);
>   
>   static struct gbphy_device *gb_gbphy_create_dev(struct gb_bundle *bundle,
> -				struct greybus_descriptor_cport *cport_desc)
> +						struct greybus_descriptor_cport *cport_desc)
>   {
>   	struct gbphy_device *gbphy_dev;
>   	int retval;
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D146BDBF4
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:49:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2CA613EB82
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:49:58 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	by lists.linaro.org (Postfix) with ESMTPS id 451623EA35
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 04:16:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=jIeJIOLL;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.221.45 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id l1so6800762wry.12
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 20:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678508185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MZ1eeqmPCIB2yO855GUqLYB3SG0cWG5CCnQ7/1cNu2o=;
        b=jIeJIOLLGVVM5N6JHLEMYkKL8y0bCVrSEAoj3w9Nk0tZZwPHhGIUETvgT9NRDX6Eqx
         +dRwM8+zAyfC+63OgUu0a4V3n4qewOfUUWr5fr9/OiDiRbCmUYzZXeq40vaosk/49V0U
         nTBSi1TN7JOgdPMBSY7qUAvZCB9FGlsILQZV/7HEka7funKPNBWBDT8HyKkfTTmZ6jmC
         Hi8nYMDsp57VlxGuQ5Fz+aRgMKWNVumZ3eDkFPCG/TAVnojyd2NlSyfxhhkOoIkDpECK
         JVMntykERbTfBC1hHAOgANseFkoR3ZG0vDQGKZZ13N8qgWYhChUrf12c9A8WrExE2IhR
         eHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678508185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ1eeqmPCIB2yO855GUqLYB3SG0cWG5CCnQ7/1cNu2o=;
        b=jR3FGGa6Z0DUDFAtPXyBZ3+w1tdT3OdpSmqhQxv1cCLSmavnawkeVhOSH8Lb1NxlWZ
         0tLsW0hDuqXRUyUeNEGOWXReMbCrDM0aiJrapFFwi7Ev2y8Gd/DYbFF3E8umy7dZkPxW
         oWyeiwDO46snhdOez7R/y6CDBR0i4AZsi+rdMy8JRzqOnuEsDFokmJ4WDQ7+nfpefqpS
         wqA3hKD9BtKEAiP5bJOUZrHajpoqGp5Zj7D5ubhMrFSerNRw9pGL0Dg0XTsgbWlQ75a3
         NDwAIGgZBB02wJpmhWxBzWxyvj4sdVH70UY0+RZwQrZkseS+umUGbxjLdJV7odzoc+O+
         kbBQ==
X-Gm-Message-State: AO0yUKW8Kq3S8mBz5ikM8isNl6+dRFMUI7ag50RO7aGsF3O8wwIfrpbM
	DjczvsMhdJmJSYY3bqtoo9E=
X-Google-Smtp-Source: AK7set9wqGdBLke8/AXSOYkqEqTSGAiOyaNSJkBw2QuiXFdlDlX1JGE/Id1kDqIXO1jD2BPpFlwflg==
X-Received: by 2002:a5d:5410:0:b0:2c7:5ad:9c69 with SMTP id g16-20020a5d5410000000b002c705ad9c69mr14484486wrv.71.1678508185051;
        Fri, 10 Mar 2023 20:16:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d4105000000b002ce92af57b2sm1316961wrp.42.2023.03.10.20.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 20:16:24 -0800 (PST)
Date: Sat, 11 Mar 2023 07:16:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 451623EA35
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[102.36.222.112:received,209.85.221.45:from];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.45:from];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UCCJ7W3ONJUA2CSREHOTHMRUH7THQDKX
X-Message-ID-Hash: UCCJ7W3ONJUA2CSREHOTHMRUH7THQDKX
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:49:52 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UCCJ7W3ONJUA2CSREHOTHMRUH7THQDKX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 11, 2023 at 03:18:04AM +0500, Khadija Kamran wrote:
> In file drivers/staging/greybus/arche-platform.c,
> - Length of line 181 exceeds 100 columns, fix by removing tabs from the
>   line.
> - If condition and spin_unlock_...() call is split into two lines, join
> them to form a single line.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
> Changes in v2:
>  - Change the subject and log message
>  - Merge if condition and spin_unlock...() from two lines to one 

Apply your patch and then re-run checkpatch.pl -f on the file.  You will
see the problem.

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

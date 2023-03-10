Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 284756B556D
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:18:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 424F73F4EC
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:18:05 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	by lists.linaro.org (Postfix) with ESMTPS id E44293F496
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 18:57:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=KyRYnDga;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.221.42 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id j2so5952465wrh.9
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 10:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678474622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xugmdf/oZmpN9857V6uOJEN0w+i6nHXgW1nzaaohj7I=;
        b=KyRYnDgaE7ug7RfVbN4Sj+G9HlPufbymI80TX3dqIdZsia4zR2YWVryAF3/vJLIoo+
         MzaL+LEdcmw4ln2AVcA9xi2P9M4me+T9UdrljPcS2jY1CUVhxvz0PHCkn+Oghiy7BzIK
         WqB+u6fc+Wg8qsdn8ol5Hm8m09K0sDlS3j959Iz8T8Ao3l+bkjh7g0KiiCNuc66jQ7j/
         9+p0BAZ2RRtw2LUtFOU+T1KDL7Geua7mJE8Zaknn1qYkHAETE8G6nfGOK9NjOdoGMlzo
         JUvn1xReRp8ZK62n/uZwHJfywPn+28tem70XFb6JTrq0Ep5a3WeBw5dLN6czj6Xy8dUH
         zmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678474622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xugmdf/oZmpN9857V6uOJEN0w+i6nHXgW1nzaaohj7I=;
        b=6JpGXKG7BQvvr4iURq6nOsSyXEDmxyF5hpgpjJFRHQ8fkwmW/epNUy3vkHpWcclk2Q
         OAgNzNDf4L+flS4PGTb3ZfCS9zWvRXG3yhyg/LvmIpKGELC+a9XET+62SuWInf4XiJKe
         fOJK5w7YPzZNSJ3TAc9BwWAyI4iVRyvs6acEBZb/HT2YbKANslvusuo5MQuyQhZjwmnL
         3whYbbrzA73X0tDBXVYk48k6Wn2h2P+ugTxjh1S8XwPiRFPW5bq1QbDR6DGkjKeyQV5W
         dYNYbRfvkqvA8YFCARznuXVUM9Yq8V7Tl0YrpVT9RTuzhBGZ7wv115PoNW3b/l863Qla
         BTQw==
X-Gm-Message-State: AO0yUKVsQLl2THAkqp3OPxDmLzLriu3kJCaMHL6Ofo2+NL5x73Q5/WPe
	9Byj8VluvPtyuNPRA/UQsm4=
X-Google-Smtp-Source: AK7set8ItTkGY1zTJ3K89fvGwJVi7Zn5bez9za14NnHtH9BdEacxpSzMlFz7gL1XJA3+5OUaYlq9Zg==
X-Received: by 2002:a05:6000:1d2:b0:2c5:48ed:d258 with SMTP id t18-20020a05600001d200b002c548edd258mr17299800wrx.35.1678474621784;
        Fri, 10 Mar 2023 10:57:01 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d4312000000b002c559626a50sm492153wrq.13.2023.03.10.10.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 10:57:01 -0800 (PST)
Date: Fri, 10 Mar 2023 23:56:59 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Message-ID: <ZAt9e8Xnd4wAnjPn@khadija-virtual-machine>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
 <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAt4irZnVJW4zQNb@ubun2204.myguest.virtualbox.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E44293F496
X-Spamd-Bar: -
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.42:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NYIU4W34A4PRR3D2UMEPM3AZGTI6T3M6
X-Message-ID-Hash: NYIU4W34A4PRR3D2UMEPM3AZGTI6T3M6
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:39 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix exceeds line length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NYIU4W34A4PRR3D2UMEPM3AZGTI6T3M6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 11, 2023 at 12:05:54AM +0530, Deepak R Varma wrote:
> On Fri, Mar 10, 2023 at 10:09:47PM +0500, Khadija Kamran wrote:
> > Length of line 182 exceeds 100 columns in file
> > drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
> > line.
> 
> Hi Khadija,
> I think if you also include merging the if condition and the call to
> spin_unlock...() on single lines, it should make the code more human. 
Hi Deepak! Sorry I am unable to understand how to merge the if condition
and spin_unlock...() together. Can you please elaborate. 
Thank you
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C77F6629
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:26:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 14A8B40A18
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:26:43 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	by lists.linaro.org (Postfix) with ESMTPS id F101D3EB98
	for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 18:06:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="CHi/I5U/";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.167.174 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b2ec5ee2e4so1320998b6e.3
        for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 11:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697911601; x=1698516401; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUzqqyc66JMYlS7ayqT1z7znMFxZmcvmwm8m+LXNCLI=;
        b=CHi/I5U/YC5HstK8WWmwbCbqoE8fUlaWWtV0HaoOVZS3knqQo2GrC8MsK6eteDBsRi
         kt/puCe37MdusJa9mV9BIKAvdNH1/Cg2cSw/ZTruFW+TQUmqgvYvqzNukASbJ0P+/Dwt
         W3ijln/P6iiBJsN7SzE65MnrJm9GN6PZJDfBfWFeLVIEupy2pauYs90XNdg976PmnP/y
         5utWtOMeJiLmwWNUe/XV1xkGcNA+r/V63AsWgfFsLaKrHR2VoWLj/isePThn1QTEzyLl
         MLwM2QAi5ZBkcJmCGCX2WcFBc2L3oY4myxNl5C7HisvAE2QfhdoX+UAXtybJhcHrzUcZ
         m+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697911601; x=1698516401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUzqqyc66JMYlS7ayqT1z7znMFxZmcvmwm8m+LXNCLI=;
        b=Vt0XI8B8Qfkgmhmm24zsvMMRu3DQIg/LMryTNDxg9odyhJZIShUR9EwC37w8sebiNW
         3TR0KVv8S/+qIGGbSe9frZXKULqeMIlUl1mbgwHVSDuBQ50kbodwO5dLlJJoI0xfB1tE
         1q21a/URMHU01kWYgz3xAEHVUAkOC/Fi/HbZRl3+Qe4r3WdxryZAcLflPg7fRvKywd/t
         m8QhfDcPFgnNyuAGCBT+k5onX/IxUMWYKUS4wPJ+Mm3L5HJnzWLs4c5vxK4hDjSRQ1+q
         dPnHCT67QQK1eIoJBn/+r/NXBln8vXsoMMbmglN+JRZpIBmE77tXvVEfqNhv7c75ljIW
         zLFg==
X-Gm-Message-State: AOJu0YyF4yiSvdczSOq2mn2xcHv2fWs8qNj5HNIp7bzTBJV7BVINrNzi
	wj4YYFhoAcikPirG1sALL2s=
X-Google-Smtp-Source: AGHT+IFV9OUT+QBGHAwcURd/bz/8xcbxn3EgnWhtBo6XXAGKsF9WmQhMZLZtFmiSxwIPRFhIHC4ByA==
X-Received: by 2002:a05:6808:222a:b0:3b2:e9ab:68e6 with SMTP id bd42-20020a056808222a00b003b2e9ab68e6mr7246790oib.0.1697911601268;
        Sat, 21 Oct 2023 11:06:41 -0700 (PDT)
Received: from ubuntu ([122.167.9.184])
        by smtp.gmail.com with ESMTPSA id d15-20020a65620f000000b0057e7ae47893sm2945165pgv.47.2023.10.21.11.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 11:06:40 -0700 (PDT)
Date: Sat, 21 Oct 2023 11:06:34 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20231021180634.GA17039@ubuntu>
References: <20231021133527.GB12776@ubuntu>
 <2023102147-educator-worry-06f4@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023102147-educator-worry-06f4@gregkh>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F101D3EB98
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email,mail-oi1-f174.google.com:rdns,mail-oi1-f174.google.com:helo];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.174:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UKQCLNHD72ZYTQYC2TUOFJQMMVRXFASJ
X-Message-ID-Hash: UKQCLNHD72ZYTQYC2TUOFJQMMVRXFASJ
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:26 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UKQCLNHD72ZYTQYC2TUOFJQMMVRXFASJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 21, 2023 at 04:45:46PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Oct 21, 2023 at 06:35:27AM -0700, Nandha Kumar Singaram wrote:
> > greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
> > linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
> > Bcc: 
> > Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
> > Reply-To: 
> > In-Reply-To: <2023102131-slacker-lily-28ff@gregkh>
> > 
> > On Sat, Oct 21, 2023 at 11:48:32AM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Oct 19, 2023 at 02:39:49PM -0700, Nandha Kumar Singaram wrote:
> > > > Adhere to linux coding style. Reported by checkpatch.pl:
> > > > CHECK: Alignment should match open parenthesis
> > > > 
> > > > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > > > ---
> > > >  drivers/staging/greybus/camera.c | 14 +++++++-------
> > > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > > > index cdbb42cd413b..405c8e78aa72 100644
> > > > --- a/drivers/staging/greybus/camera.c
> > > > +++ b/drivers/staging/greybus/camera.c
> > > > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> > > >  }
> > > >  
> > > >  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > > > -		struct gb_camera_configure_streams_response *resp)
> > > > +				      struct gb_camera_configure_streams_response *resp)
> > > >  {
> > > >  	unsigned int max_pkt_size = 0;
> > > >  	unsigned int i;
> > > > @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > > >   * Validate the stream configuration response verifying padding is correctly
> > > >   * set and the returned number of streams is supported
> > > >   */
> > > > -static const int gb_camera_configure_streams_validate_response(
> > > > -		struct gb_camera *gcam,
> > > > +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> > > 
> > > Why change this line?
> > >
> > did these Code change to fix CHECK: Lines should not end with a '(' reported by
> > checkpatch.pl
> 
> That's great, but you didn't say that in your changelog text, so it
> looks wrong here :(
> 
> thanks,
> 
> greg k-h

Sorry for missing that, will add and send the updated patch.

Regards,
Nandha Kumar
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

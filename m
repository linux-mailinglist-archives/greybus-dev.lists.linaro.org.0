Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6DF7F6638
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2DCA540ADF
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:53 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	by lists.linaro.org (Postfix) with ESMTPS id 375C53EB98
	for <greybus-dev@lists.linaro.org>; Sat, 28 Oct 2023 20:22:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=fG7QWPuH;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.210.174 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso2920706b3a.2
        for <greybus-dev@lists.linaro.org>; Sat, 28 Oct 2023 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698524550; x=1699129350; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fe5fXMkIr7EM+O0J9n+FRFXxzPWDHsSnu766yF1x2Vw=;
        b=fG7QWPuHTriXaYCS3psSGfAzV2jKwt8VpkNHIJhBZJz6rPGmTP+xv2sK/2OWmoJ4u7
         hjTv0bkb5h3UX2as/DRhWU+1vxwvz3kaN5OLx2s7IV/jIgC+NOnMt88ozCMiBsQQFicx
         Wg5kNpl9N3BpY6FI0c2hHtZBxhPlJ/5Zv21tVgyyJUTHdPPaU1dYV45nIAVDnTaXMLGM
         XoYYxOW/hOU+pwgTt2VGgjrtJW9wS5nEZ/zm0XkK1IVOLjXSOCxRRd9CjZhS7AXtvyek
         EJd/AY1VCDEOkoHo383VzJWcVad9JfxubqH0KphEv13TwHpTLiZkAafQBchUCcmVwWIC
         BU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698524550; x=1699129350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fe5fXMkIr7EM+O0J9n+FRFXxzPWDHsSnu766yF1x2Vw=;
        b=Mhrhgr5yFbfiA21knj/HcAlU63sYwWagUBY5I62Amg61L1hQ1ZAgJB5tyqFsrubrQp
         FGrw4L3zZ1PT2NfpYKOa8qY8sq2czZfzqc4KYFEcZy8qmcXDYDuIUwHvZqG/1I346sHb
         CvjmHg/yQCMciFqYZQmy4nhqyTwJvhynBEtI4ERr9DfCMrE23pbqPB1nXK86Udu5eknU
         +S8t0nvI/3zHgRlVY2oXUXNP8h3lPJ4+zzHPqsAve1UAg2yXpmlToSnp5nohCC6sGxts
         i9o47iGcqTbg0GDOUf9R7/NKtRzxlQXreoMo1J1a0P98q2maPHs2Qk+6PdPuxW9yDzpk
         HmeQ==
X-Gm-Message-State: AOJu0YzVASb/9LULVYwbNwsR10cPjYrTpzLQ9VqMrmHd860sEhg4Hgxg
	llFZw/2gYRLu9sS240t8MfI=
X-Google-Smtp-Source: AGHT+IFdkZReASb/EOwlYOdiXGWEctOWhxdfuppy/VQoYmCS9GGra1jo2ndmWGzw3i5h2aj7sGXhsA==
X-Received: by 2002:a05:6a20:3d83:b0:13f:c40c:379 with SMTP id s3-20020a056a203d8300b0013fc40c0379mr7358092pzi.13.1698524550125;
        Sat, 28 Oct 2023 13:22:30 -0700 (PDT)
Received: from ubuntu ([122.171.167.85])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902684100b001c74df14e6esm3658613pln.51.2023.10.28.13.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 13:22:29 -0700 (PDT)
Date: Sat, 28 Oct 2023 13:22:20 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <20231028202220.GA2432@ubuntu>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
 <d2630a16ff9eca40b03dcade63c197fdd5e5b78f.1697976302.git.nandhakumar.singaram@gmail.com>
 <7703f20b-60e1-4140-8380-5a5157bc49b0@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7703f20b-60e1-4140-8380-5a5157bc49b0@ieee.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 375C53EB98
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.174:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5JADYOAG5AMS37EBEDLRUE2BOFIN4E3G
X-Message-ID-Hash: 5JADYOAG5AMS37EBEDLRUE2BOFIN4E3G
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:27:06 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/3] staging: greybus: camera: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5JADYOAG5AMS37EBEDLRUE2BOFIN4E3G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 26, 2023 at 01:18:04PM -0500, Alex Elder wrote:
> On 10/22/23 7:15 AM, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > CHECK: Alignment should match open parenthesis
> 
> Generally, the result of this patch in isolation looks OK.
> But when you compare it with your next patch, what you're
> doing here becomes inconsistent with the indentation used
> for the function arguments there.
> 
> There is value in consistency as advocated by checkpatch,
> but there's also value in consistency within a single
> source file.
> 
> I'd stay away from these white space changes.
> 
> 					-Alex
> 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >   drivers/staging/greybus/camera.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index ae49e37a87e9..6516e7efaab9 100644
> > --- a/drivers/staging/greybus/camera.c
> > +++ b/drivers/staging/greybus/camera.c
> > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> >   }
> >   static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp)
> > +				      struct gb_camera_configure_streams_response *resp)
> >   {
> >   	unsigned int max_pkt_size = 0;
> >   	unsigned int i;
> > @@ -378,8 +378,8 @@ struct ap_csi_config_request {
> >   #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
> >   static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp,
> > -		struct gb_camera_csi_params *csi_params)
> > +					   struct gb_camera_configure_streams_response *resp,
> > +					   struct gb_camera_csi_params *csi_params)
> >   {
> >   	struct ap_csi_config_request csi_cfg;
> >   	struct gb_connection *conn;
> > @@ -783,8 +783,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
> >   }
> >   static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
> > -		unsigned int *flags, struct gb_camera_stream *streams,
> > -		struct gb_camera_csi_params *csi_params)
> > +					  unsigned int *flags, struct gb_camera_stream *streams,
> > +					  struct gb_camera_csi_params *csi_params)
> >   {
> >   	struct gb_camera *gcam = priv;
> >   	struct gb_camera_stream_config *gb_streams;
>

Thanks Alex for the review.

yeah, I understood about the indentation issue when comparing 
to other patch but fixing the indentation there results in 
another checkpatch check(CHECK: line length of 113 exceeds 100
columns) so didn't added any change over there. 

Regards,
Nandha Kumar
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

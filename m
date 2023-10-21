Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA8F7F6627
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:26:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9CCBF3F98E
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:26:31 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id 8C9F43EC4B
	for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 13:05:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=WWGMm7op;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cac925732fso10465485ad.1
        for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697893540; x=1698498340; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G5f1f0vQfSjdVi/REtt5j0YQgF8soTdJTFMLk1PEhnc=;
        b=WWGMm7opobLNSonPePctYqcPR7aryQfDr0PUL3HfjcJdKFyaJchRyoTNHjpT9lrI9x
         r2dMTEJ/aHq9y8mTZ755UUJyLsaSSYMY6y+cp2nJQ9kxSkJ+u6FXqohxGOUXFNCv5gvV
         6DYyfU27RMk1aPoIz79pM03WgaNds+AdbzB5PX0c8xGyTJ0X5PQ6fQBatzgrfPccMlin
         lCLbLWAN2KQKkPn2ZRM68AkVYcqZAGW73dKqjZx0isN7z++teoji3TmRBj2aaB03FqG8
         A8ALcwYeqTuRwSSUEsCebqRSBNF9MIjWeEIdno8QDt63kBDsj7RCUe3duKLMgVIghaph
         bFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697893540; x=1698498340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5f1f0vQfSjdVi/REtt5j0YQgF8soTdJTFMLk1PEhnc=;
        b=CsnL1lPvj3mc3aidTMDSG9Um7ori89VYsv/FtZu8PUGqMNp31b9qPBpM2yLY3Q5pt9
         lEaYlbwn7RuTLF2IkbjJO8OX3E3y0HjnYvrHj5ynI6XzculUBuSYJLs3b/0gZ2+xmcYF
         g0r0W08EOT+omjIOhxP93zhGAOxlzqQZvwb6AhdJrBdjM1tQJ/0bc4C7F7wBfWPSCJlJ
         0JhC218x9X8PmedtMDYMn55A5BYco/8+ka40+d7aBF9l6WNWVzdSdtRyuZF1cO1wgi8Y
         ev+O+m8oB9edAnyptoaDoQ/AeLgic/qeEBMgmoEjoYlyO0bodDooxLfoMTBGAs6oRvfx
         z+fg==
X-Gm-Message-State: AOJu0YwiiNwidTLnefHmb6t15EJOU879a7xP3EQTe0bRiIR1y98tFvm9
	EmnE4mQA/eI6q+lNcVxmjzE=
X-Google-Smtp-Source: AGHT+IFHYGt3bF0G2tCnQmvxBHxEud8YIBJqmnRa57y5tilld1MEtDW8BNCG6blbLAEA1bLsnbhCeQ==
X-Received: by 2002:a17:903:2012:b0:1c5:bea4:8537 with SMTP id s18-20020a170903201200b001c5bea48537mr2867431pla.15.1697893540382;
        Sat, 21 Oct 2023 06:05:40 -0700 (PDT)
Received: from ubuntu ([122.167.9.184])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902da8600b001c9c8d761a3sm3130187plx.131.2023.10.21.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 06:05:40 -0700 (PDT)
Date: Sat, 21 Oct 2023 06:05:35 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <20231021130535.GA12776@ubuntu>
References: <20231019213949.GA2922@ubuntu>
 <e24e41be-b2c4-4bda-8a34-a628c55c4061@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e24e41be-b2c4-4bda-8a34-a628c55c4061@ieee.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8C9F43EC4B
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: F6EJNMPRXETTKXI5BF2H7DX2ZF7OKQXJ
X-Message-ID-Hash: F6EJNMPRXETTKXI5BF2H7DX2ZF7OKQXJ
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:25 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F6EJNMPRXETTKXI5BF2H7DX2ZF7OKQXJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 19, 2023 at 07:15:37PM -0500, Alex Elder wrote:
> On 10/19/23 4:39 PM, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > CHECK: Alignment should match open parenthesis
> 
> Sometimes checkpatch.pl warns about things that are not
> really that important.  One class of this type of issue
> is white space errors.
> 
> Yes, consistency is good, but the kernel simply doesn't
> have universally consistent conventions, and I doubt
> it ever will.  There might be times where a source file
> consistently follows a white space convention that
> differs from what checkpatch wants.  Suggesting a
> wholesale change to that file to "fix" that typically
> wouldn't be welcome.
> 
> Unfortunately without some experience it's hard to know
> which checkpatch warnings can be safely ignored.  I would
> place white space warnings at a lower priority for fixing
> than some others.  For example, this is also a pretty
> trivial warning:
>   CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid precedence
> issues
> And it is most likely not a problem in this case, but fixing
> this type of warning is probably more constructive than
> just adjusting white space.
> 
> I have no objection to your patch, and it's a fine way to
> get some experience with the patch process, but I don't
> think this particular change is necessary.
> 
> 					-Alex
> 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >   drivers/staging/greybus/camera.c | 14 +++++++-------
> >   1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index cdbb42cd413b..405c8e78aa72 100644
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
> > @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> >    * Validate the stream configuration response verifying padding is correctly
> >    * set and the returned number of streams is supported
> >    */
> > -static const int gb_camera_configure_streams_validate_response(
> > -		struct gb_camera *gcam,
> > +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> >   		struct gb_camera_configure_streams_response *resp,
> >   		unsigned int nstreams)
> >   {
> > @@ -378,8 +377,8 @@ struct ap_csi_config_request {
> >   #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
> >   static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp,
> > -		struct gb_camera_csi_params *csi_params)
> > +					   struct gb_camera_configure_streams_response *resp,
> > +					   struct gb_camera_csi_params *csi_params)
> >   {
> >   	struct ap_csi_config_request csi_cfg;
> >   	struct gb_connection *conn;
> > @@ -783,8 +782,9 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
> >   }
> >   static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
> > -		unsigned int *flags, struct gb_camera_stream *streams,
> > -		struct gb_camera_csi_params *csi_params)
> > +					  unsigned int *flags,
> > +					  struct gb_camera_stream *streams,
> > +					  struct gb_camera_csi_params *csi_params)
> >   {
> >   	struct gb_camera *gcam = priv;
> >   	struct gb_camera_stream_config *gb_streams;
> 

Thanks Alex for the review and feedback.

Regards,
Nandha Kumar
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

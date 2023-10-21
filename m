Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4677F6628
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:26:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7BD253F98E
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:26:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id EDD033EC4B
	for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 13:35:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=XEnKeknG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cac925732fso10572735ad.1
        for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697895332; x=1698500132; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsKAD0VhAPmzCctVVdKp45X+1iQVX0c5X8MLMjRCHgY=;
        b=XEnKeknGqgwWYT254tm1B3k76huzOfjgatP0W3D6wv3Za+jLMdNue+QlI7n1ZK2jdH
         Y5kxVMw6XyRGCP5AAmidBTUV+CSgpTVN2Q5EWZ4JPWvtqK4DMcfeEHjxbTLEahQiwzfc
         mLxTquGBPSwLh6zixTchW+FyaHefLEaOpRl4Xovpwbiv7zLMukE3JQgRQy36dE4ryQIT
         aFLyqCD9DeABwPkP2qRlDP4blHrSnB1vP7glfgCZvAVVarkWn9zoyH04G7rjvx0Hw3QZ
         QOSLL+gMKgPGq+70L/gAtOtVEe9l41afRXBn9jGNECpsGoyLS1XDJwqFr6GSw98wDwlE
         GmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697895332; x=1698500132;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsKAD0VhAPmzCctVVdKp45X+1iQVX0c5X8MLMjRCHgY=;
        b=K/BmX9GPUn6uOY66gwPT57aRUaipaLUYFuQ5BiWbVUdi126bohWPeSwOfIQc2oOTC8
         bHqEX0yXlTWvRQ5yeODvooISBqZoxFhPyMon6Mf6/ghNWnORhW97NgkuK/+MbEsPsqLB
         2fuWoUeYHr5xIsb3BWo73d18NMuIFhwfpqc+eYp97QbTUIALC+Vq1iF/fY0rpHIvemJy
         oC1bPh6FaVGQj2oQaeycZ0Xe4UF09MVuMoFPd/Nr314XT6qYDgygL8xEldOzPnvFladN
         XAyPS+XHRWMqWiikbVbkspFOcNevbcyBHyjUgw3qTdlM/EY0CZ7w6f5lCMiARNIU5igA
         X+8A==
X-Gm-Message-State: AOJu0YwkhFG8J1vp1r6s+HzXBPZ48zGMi+D9eCZEpCuy0n4EHXkbxVST
	V9jELp6z515LQwvtoWv+gsQ=
X-Google-Smtp-Source: AGHT+IG7/tbMEfdamoXp/VmbamxwRPF/ONl8l/tI/NBlmfVZMDJBEwW89HUUGTHoMHhSas3xIs2Njw==
X-Received: by 2002:a17:902:e744:b0:1c9:d3ce:e7d3 with SMTP id p4-20020a170902e74400b001c9d3cee7d3mr4144528plf.4.1697895331941;
        Sat, 21 Oct 2023 06:35:31 -0700 (PDT)
Received: from ubuntu ([122.167.9.184])
        by smtp.gmail.com with ESMTPSA id q13-20020a17090311cd00b001ca773d674bsm3175577plh.278.2023.10.21.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 06:35:31 -0700 (PDT)
Date: Sat, 21 Oct 2023 06:35:27 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20231021133527.GB12776@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EDD033EC4B
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.90 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	THREAD_HIJACKING_FROM_INJECTOR(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	FAKE_REPLY(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
	TAGGED_FROM(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Z6BGTRZZ2U2E67LVMJNZ6TWW7QUE2SCB
X-Message-ID-Hash: Z6BGTRZZ2U2E67LVMJNZ6TWW7QUE2SCB
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:26 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z6BGTRZZ2U2E67LVMJNZ6TWW7QUE2SCB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Bcc: 
Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
Reply-To: 
In-Reply-To: <2023102131-slacker-lily-28ff@gregkh>

On Sat, Oct 21, 2023 at 11:48:32AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Oct 19, 2023 at 02:39:49PM -0700, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > CHECK: Alignment should match open parenthesis
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >  drivers/staging/greybus/camera.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index cdbb42cd413b..405c8e78aa72 100644
> > --- a/drivers/staging/greybus/camera.c
> > +++ b/drivers/staging/greybus/camera.c
> > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> >  }
> >  
> >  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp)
> > +				      struct gb_camera_configure_streams_response *resp)
> >  {
> >  	unsigned int max_pkt_size = 0;
> >  	unsigned int i;
> > @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> >   * Validate the stream configuration response verifying padding is correctly
> >   * set and the returned number of streams is supported
> >   */
> > -static const int gb_camera_configure_streams_validate_response(
> > -		struct gb_camera *gcam,
> > +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> 
> Why change this line?
>
did these Code change to fix CHECK: Lines should not end with a '(' reported by
checkpatch.pl

> It's fine, but then:
> 
> >  		struct gb_camera_configure_streams_response *resp,
> >  		unsigned int nstreams)
> 
> These lines are not fixed up?
> 
> thanks,
> 
> greg k-h

Fixing these lines results in another checkpatch check(CHECK: line length 
of 113 exceeds 100 columns) so didn't added any change

Thanks,
Nandha Kumar
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
